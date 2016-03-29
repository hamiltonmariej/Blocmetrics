class User < ActiveRecord::Base
  has_many :registered_applications, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  before_save { self.role ||= :standard }

# need to check on this...would I use UserMailer instead?
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args)
  end

  enum role: [:standard, :admin]
end

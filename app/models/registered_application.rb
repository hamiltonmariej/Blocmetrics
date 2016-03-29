class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :events

  validates :name, presence: true
  validates :url, presence: true
  # validates_uniqueness_of :url
  # validates :url, format => { :with => /\Ahttps?:\/\/[^\n]+\z/i }
  #
  # before_validation :smart_add_url_protocol
  #
  # protected
  #
  # def smart_add_url_protocol
  #   unless self.url[/^Ahttps:\/\//] || self.url[/^Ahttp:\/\//]
  #     self.url = "http://#{self.url}"
  #   end
  # end
end

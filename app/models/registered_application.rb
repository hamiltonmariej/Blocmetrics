class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :events

  validates :name, presence: true
  validates :url, presence: true
end

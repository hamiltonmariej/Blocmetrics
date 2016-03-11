class Event < ActiveRecord::Base
  belongs_to :registered_application, :dependent => :destroy
  validates_presence_of :registered_application_id
end

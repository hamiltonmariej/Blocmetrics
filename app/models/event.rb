class Event < ActiveRecord::Base
  belongs_to :registered_application, :dependent => :destroy
end

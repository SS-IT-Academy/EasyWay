class Recipient < ActiveRecord::Base
  attr_accessible :group_number, :notify_event_id, :user_id
  validates :group_number, :presence => true
  validates :notify_event_id, :presence => true
  validates :user_id, :presence => true
  belongs_to :notify_event
  
end

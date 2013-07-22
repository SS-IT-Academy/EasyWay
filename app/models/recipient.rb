class Recipient < ActiveRecord::Base
  attr_accessible :group_number, :notify_event_id, :user_id
  validates :group_number, :numericality => true
  validates :notify_event_id, :numericality => true
  validates :user_id, :numericality => true
  belongs_to :notify_event
  
end

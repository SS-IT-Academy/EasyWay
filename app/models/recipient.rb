class Recipient < ActiveRecord::Base
  attr_accessible :group_number, :notifyevent_id, :user_id
  validates :group_number, :numericality => true
  validates :notifyevent_id, :numericality => true
  validates :user_id, :numericality => true
  belongs_to :notifyevents
  
end

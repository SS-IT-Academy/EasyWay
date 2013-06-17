class Recipient < ActiveRecord::Base
  belongs_to :notifyevents
  attr_accessible :group_number, :notifyevent_id, :user_id
end

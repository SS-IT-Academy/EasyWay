class Recurrence < ActiveRecord::Base
	include IceCube

  attr_accessible :repetition, :hour_duration, :minute_duration
  
  has_many :events

  serialize :repetition, Hash

  def repetition=(new_rec)
	  if new_rec.blank? || new_rec == "{}" || !(rec_select = RecurringSelect.dirty_hash_to_rule(new_rec))
	    write_attribute(:repetition, nil)
	  else	    
      write_attribute(:repetition, rec_select.to_hash)
	  end
	end

end

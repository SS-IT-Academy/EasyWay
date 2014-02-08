class Recurrence < ActiveRecord::Base
	include IceCube

  attr_accessible :repetition, :end_date, :start_date
  
  has_many :events
  
  validates :end_date, :start_date, :presence => true

  serialize :repetition, Hash

  def repetition=(new_rec)
	  if new_rec == "{}"
	    write_attribute(:repetition, nil)
	  else	    
      write_attribute(:repetition, RecurringSelect.dirty_hash_to_rule(new_rec).to_hash)
	  end
	end

  def get_repetition
    schedule = Schedule.new(self.start_date)
    rule = RecurringSelect.dirty_hash_to_rule(self.repetition)
    schedule.add_recurrence_rule rule.until(self.end_date)
    schedule.all_occurrences
  end

end

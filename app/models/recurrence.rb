class Recurrence < ActiveRecord::Base
	include IceCube

  attr_accessible :repetition, :end_date, :start_date
  
  has_many :events
  
  validates :end_date, :start_date, :presence => true

  serialize :repetition, Hash

  def repetition=(new_rec)
	  if RecurringSelect.is_valid_rule?(new_rec)
	    write_attribute(:repetition, RecurringSelect.dirty_hash_to_rule(new_rec).to_hash)
	  else
	    write_attribute(:repetition, nil)
	  end
	end

	def schedule
    schedule = Schedule.new(self.start_date)
    if self.repetition.blank?
      #no
    else
      schedule.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(self.repetition).until(self.start_date))
    end
    schedule
  end

end

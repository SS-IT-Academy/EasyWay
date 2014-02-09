class Recurrence < ActiveRecord::Base
	include IceCube

  attr_accessible :repetition, :end_date, :start_date
  
  has_many :events
  
  validates :end_date, :start_date, :presence => true
  validate :date_validation

  serialize :repetition, Hash

  def repetition=(new_rec)
	  if new_rec == "{}"
	    write_attribute(:repetition, nil)
	  else	    
      write_attribute(:repetition, RecurringSelect.dirty_hash_to_rule(new_rec).to_hash)
	  end
	end

  def get_repetition
    unless repetition.nil?
      schedule = Schedule.new(self.start_date)
      rule = RecurringSelect.dirty_hash_to_rule(self.repetition)
      schedule.add_recurrence_rule rule.until(self.end_date)
      schedule.all_occurrences
    end
  end

  private
    def date_validation
      if start_date  > end_date
        errors.add(:start_date, "Start date can't be greater than end date")
      end
    end

end

module EventModule

  include IceCube

  def get_duration(params)
    hours_duration = params[:hours_duration].to_i
    minutes_duration = params[:minutes_duration].to_i
    self.recurrence.duration = hours_duration.hour + minutes_duration.minutes
  end

  def get_repetition
    unless self.recurrence.repetition.nil?
      schedule = Schedule.new(self.start_at.to_time)
      rule = RecurringSelect.dirty_hash_to_rule(self.recurrence.repetition)
      schedule.add_recurrence_rule rule.until(self.end_at.to_time)
      schedule.all_occurrences
    end
  end

  def create_children_event(duration)
    validator = 0
    unless self.recurrence.repetition.nil?
      all_repetition = self.get_repetition
      all_repetition.each_with_index do |occurrence, index| self.children.build(
        name: self.name,
        event_type_id: self.event_type_id,
        start_at: occurrence, 
        end_at: occurrence + duration
      )
      if index > 0
        if validator > occurrence
          self.children.destroy_all
          break
        end
      end
      validator = occurrence + duration  
      end
    end
  end

  def update_children_event(duration)
    validator = 0
    unless self.recurrence_id.nil?
      unless self.recurrence.repetition.nil?
        all_repetition = self.get_repetition        
        all_repetition.each_with_index do |occurrence, index| self.children.create(
          name: self.name,
          event_type_id: self.event_type_id,
          start_at: occurrence, 
          end_at: occurrence + duration
        )
        if index > 0
          if validator > occurrence
            self.children.destroy_all
            break
          end
        end
        validator = occurrence + duration           
        end
      end
    end
  end
  
end
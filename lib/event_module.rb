module EventModule

  include IceCube

  def get_duration(params)
    hours_duration = recurrence_attributes(params)[:hour_duration].to_i
    minutes_duration = recurrence_attributes(params)[:minute_duration].to_i
    duration = hours_duration.hour + minutes_duration.minutes
  end

  def get_repetition
    unless self.recurrence.repetition.nil? || self.start_at.blank?
      schedule = Schedule.new(self.start_at.to_time)
      rule = RecurringSelect.dirty_hash_to_rule(self.recurrence.repetition)
      schedule.add_recurrence_rule rule.until(self.end_at.to_time)
      schedule.all_occurrences
    else
      []  
    end
  end

  def create_children_event(duration)
    unless self.recurrence.repetition.nil?
      all_repetition = self.get_repetition
      all_repetition.each_with_index do |occurrence, index| self.children.build(
        name: "#{self.name} #{index+1}",
        event_types_id: self.event_types_id,
        start_at: occurrence, 
        end_at: occurrence + duration
      )  
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
          event_types_id: self.event_types_id,
          start_at: occurrence, 
          end_at: occurrence + duration
        )                  
        end
      end
    end
  end

  def recurrence_attributes(params)
    if params[:event] && params[:event][:recurrence_attributes]
      params[:event][:recurrence_attributes] 
    else
      {hour_duration: 0, minute_duration: 0}
    end 
  end
end
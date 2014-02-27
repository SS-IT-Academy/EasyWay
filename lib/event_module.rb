module EventModule
	def set_start_at_and_duration
		date_start_at = params[:date_start_at][0].to_time
	  hour_start_at = params[:date][:hour].to_i
	  minute_start_at = params[:date][:minute].to_i
	  @event.start_at = date_start_at + hour_start_at.hour + minute_start_at.minutes	  
	
		days_duration = params[:days_duration].to_i
    hours_duration = params[:hours_duration].to_i
    minutes_duration = params[:minutes_duration].to_i
    @current_duration = days_duration.day + hours_duration.hour + minutes_duration.minutes
    @event.duration = @event.start_at + @current_duration
	end

	def create_children_event
		validator = 0
    unless @event.recurrence.repetition.nil?
      all_repetition = @event.recurrence.get_repetition
      all_repetition.each_with_index do |occurrence, index| @event.children.build(
        name: @event.name,
        event_type_id: @event.event_type_id,
        start_at: occurrence, 
        duration: occurrence + @current_duration
      )
      if index > 0
        if validator > occurrence
          @event.children.destroy_all
          break
        end
      end
      validator = occurrence + @current_duration  
      end
    end
	end

	def update_children_event
		validator = 0
    unless @event.recurrence_id.nil?
      unless @event.recurrence.repetition.nil?
        all_repetition = @event.recurrence.get_repetition        
        all_repetition.each_with_index do |occurrence, index| @event.children.create(
          name: @event.name,
          event_type_id: @event.event_type_id,
          start_at: occurrence, 
          duration: occurrence + @current_duration
        )
        if index > 0
          if validator > occurrence
            @event.children.destroy_all
            break
          end
        end
        validator = occurrence + @current_duration           
        end
      end
    end
	end
	
end
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

	def event_create
		validator = 0
    unless @event.recurrence.repetition.nil?
      all_repetition = @event.recurrence.get_repetition
      0.upto(all_repetition.length-1) do |i| @event.children.build(
          name: @event.name,
          event_type_id: @event.event_type_id,
          start_at: all_repetition[i], 
          duration: all_repetition[i] + @current_duration
        )
        if i > 0
          if validator > all_repetition[i]
            @event.children.destroy_all
            break
          end
        end
        validator = all_repetition[i] + @current_duration  
      end
    end
	end

	def event_update
		validator = 0
      unless @event.recurrence_id.nil?
        unless @event.recurrence.repetition.nil?
          all_repetition = @event.recurrence.get_repetition
            0.upto(all_repetition.length-1) do |i| @event.children.create(
              name: @event.name,
              event_type_id: @event.event_type_id,
              start_at: all_repetition[i], 
              duration: all_repetition[i] + @current_duration
            )
            if i > 0
              if validator > all_repetition[i]
                @event.children.destroy_all
                break
              end
            end
            validator = all_repetition[i] + @current_duration           
          end
        end
      end
	end
	
end
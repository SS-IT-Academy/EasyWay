class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @parent_events = Event.where(parent_id: nil)
    @parent_events = @parent_events.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @child_events = Event.where(parent_id: @event.id)
    @child_events = @child_events.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @events = Event.all
    @event_types = EventType.all
    @recurrences = Recurrence.all
    @event.recurrence = Recurrence.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @events = Event.all
    @event_types = EventType.all
    @resources = Resource.all
    @recurrences = Recurrence.all
    @event_resources = EventResource.where("event_id = ?", @event.id)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    date_start_at = params[:date_start_at][0].to_time
    hour_start_at = params[:date][:hour].to_i
    minute_start_at = params[:date][:minute].to_i
    @event.start_at = date_start_at + hour_start_at.hour + minute_start_at.minutes
    
    days_duration = params[:days_duration].to_i
    hours_duration = params[:hours_duration].to_i
    minutes_duration = params[:minutes_duration].to_i
    current_duration = days_duration.day + hours_duration.hour + minutes_duration.minutes
    @event.duration = @event.start_at + current_duration

    validator = 0
    unless @event.recurrence.repetition.nil?
      all_repetition = @event.recurrence.get_repetition
      0.upto(all_repetition.length-1) do |i| @event.children.build(
          name: @event.name,
          event_type_id: @event.event_type_id,
          start_at: all_repetition[i], 
          duration: all_repetition[i] + current_duration
        )
        if i > 0
          if validator > all_repetition[i]
            @event.children.destroy_all
            break
          end
        end
        validator = all_repetition[i] + current_duration  
      end
    end

    respond_to do |format|
      if @event.save
        if params[:resources]
          params[:resources].each {|param|
            @resource = EventResource.new({:resource_id => param[:value], :event_id => @event.id})
            @resource.save

            @event.children.each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
          }
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        else
          format.html { redirect_to @event }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    date_start_at = params[:date_start_at][0].to_time
    hour_start_at = params[:date][:hour].to_i
    minute_start_at = params[:date][:minute].to_i
    @event.start_at = date_start_at + hour_start_at.hour + minute_start_at.minutes
    
    days_duration = params[:days_duration].to_i
    hours_duration = params[:hours_duration].to_i
    minutes_duration = params[:minutes_duration].to_i
    @current_duration = days_duration.day + hours_duration.hour + minutes_duration.minutes
    @event.duration = @event.start_at + @current_duration
    
    respond_to do |format|
      if @event.update_attributes(params[:event])

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

        params[:resources].each {|param|
          if param[:id]
            @resource = EventResource.find(param[:id])
            @resource.update_attributes({:resource_id => param[:value], :event_id => @event.id})

            @event.children.each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
          else
            @resource = EventResource.new({:resource_id => param[:value], :event_id => @event.id})
            @resource.save

            @event.children.each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
          end
        }
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.children.each do |child|
      child.event_resources.destroy_all
    end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def event_based_on
    @event = Event.find(params[:id])
    @event_resources = @event.resources
    @event_all = {
      :event => @event,
      :resources => @event_resources
    }
    render :json => @event_all.to_json
  end
end

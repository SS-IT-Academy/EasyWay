class EventsController < ApplicationController

  before_filter :find_event, only:[:show, :edit, :update, :destroy]

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
    @events = Event.all
    @event_types = EventType.all
    @resources = Resource.all
    @recurrences = Recurrence.all
    @event_resources = EventResource.where("event_id = ?", @event.id)
    @event_resources_without_first = EventResource.where("event_id = ?", @event.id)
    @event_resources_without_first.shift
  end

  # POST /events
  # POST /events.json  
  def create
    @event = Event.new(params[:event])

    duration = @event.get_duration params  
    @event.recurrence ||= Recurrence.find(@event.recurrence_id.to_i) if @event.recurrence_id
    @event.create_children_event(duration)
    respond_to do |format|
      if @event.save     
        if params[:resources]
          params[:resources].each do |param|
            @resource = EventResource.new({:resource_id => param[:value], :event_id => @event.id})
            @resource.save

            @event.children.each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
          end
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
    
    if @event.parent_id.nil?
      duration = @event.get_duration params
    end  

    respond_to do |format|
      if @event.update_attributes(params[:event])

        @event.update_children_event(duration)

        params[:resources].each do |param|
          if param[:id]

            @resource = EventResource.find(param[:id])
            @resource.update_attributes({:resource_id => param[:value], :event_id => @event.id})  

            Event.where('parent_id = ?', @event.id).each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
            
          else
            @resource = EventResource.new({:resource_id => param[:value], :event_id => @event.id})
            @resource.save

            Event.where('parent_id = ?', @event.id).each do |child|
              @resources = EventResource.new({:resource_id => param[:value], :event_id => child.id})
              @resources.save
            end
          end
        end
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

  private
    def find_event
      @event = Event.find(params[:id])
    end
end

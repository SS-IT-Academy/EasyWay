class EventResourcesController < ApplicationController
  # GET /event_resources
  # GET /event_resources.json
  def index
    @event_resources = EventResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_resources }
    end
  end

  # GET /event_resources/1
  # GET /event_resources/1.json
  def show
    @event_resource = EventResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_resource }
    end
  end

  # GET /event_resources/new
  # GET /event_resources/new.json
  def new
    @event_resource = EventResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_resource }
    end
  end

  # GET /event_resources/1/edit
  def edit
    @event_resource = EventResource.find(params[:id])
  end

  # POST /event_resources
  # POST /event_resources.json
  def create
    @event_resource = EventResource.new(params[:event_resource])

    respond_to do |format|
      if @event_resource.save
        format.html { redirect_to @event_resource, notice: 'Event resource was successfully created.' }
        format.json { render json: @event_resource, status: :created, location: @event_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @event_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_resources/1
  # PUT /event_resources/1.json
  def update
    @event_resource = EventResource.find(params[:id])

    respond_to do |format|
      if @event_resource.update_attributes(params[:event_resource])
        format.html { redirect_to @event_resource, notice: 'Event resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_resources/1
  # DELETE /event_resources/1.json
  def destroy
    @event_resource = EventResource.find(params[:id])
    @event_resource.destroy

    respond_to do |format|
      format.html { redirect_to event_resources_url }
      format.json { head :no_content }
    end
  end
  
  def remove_event_resource
    @event_resource = EventResource.find(params[:id])
    @event_resource.destroy
    render :json => @event_resource.to_json    
  end
end

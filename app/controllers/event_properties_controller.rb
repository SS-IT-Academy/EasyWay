class EventPropertiesController < ApplicationController
  # GET /event_properties
  # GET /event_properties.json
  def index
    @event_properties = EventProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_properties }
    end
  end

  # GET /event_properties/1
  # GET /event_properties/1.json
  def show
    @event_property = EventProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_property }
    end
  end

  # GET /event_properties/new
  # GET /event_properties/new.json
  def new
    @event_property = EventProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_property }
    end
  end

  # GET /event_properties/1/edit
  def edit
    @event_property = EventProperty.find(params[:id])
  end

  # POST /event_properties
  # POST /event_properties.json
  def create
    @event_property = EventProperty.new(params[:event_property])

    respond_to do |format|
      if @event_property.save
        format.html { redirect_to @event_property, notice: 'Event property was successfully created.' }
        format.json { render json: @event_property, status: :created, location: @event_property }
      else
        format.html { render action: "new" }
        format.json { render json: @event_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_properties/1
  # PUT /event_properties/1.json
  def update
    @event_property = EventProperty.find(params[:id])

    respond_to do |format|
      if @event_property.update_attributes(params[:event_property])
        format.html { redirect_to @event_property, notice: 'Event property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_properties/1
  # DELETE /event_properties/1.json
  def destroy
    @event_property = EventProperty.find(params[:id])
    @event_property.destroy

    respond_to do |format|
      format.html { redirect_to event_properties_url }
      format.json { head :no_content }
    end
  end
end

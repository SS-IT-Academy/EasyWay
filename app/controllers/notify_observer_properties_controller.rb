class NotifyObserverPropertiesController < ApplicationController
  # GET /notify_observer_properties
  # GET /notify_observer_properties.json
  def index
    @notify_observer_properties = NotifyObserverProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notify_observer_properties }
    end
  end
  
  def get_notify_observer_properties
      @notify_observer_properties = NotifyObserverProperty.all
      render :json => @notify_observer_properties.to_json
    end
    
  def get_notify_template_mappings
      @notify_observer_properties = NotifyObserverProperty.all
      render :json => @notify_observer_properties.to_json
    end
  # GET /notify_observer_properties/1
  # GET /notify_observer_properties/1.json
  def show
    @notify_observer_property = NotifyObserverProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify_observer_property }
    end
  end

  # GET /notify_observer_properties/new
  # GET /notify_observer_properties/new.json
  def new
    @notify_observer_property = NotifyObserverProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify_observer_property }
    end
  end

  # GET /notify_observer_properties/1/edit
  def edit
    @notify_observer_property = NotifyObserverProperty.find(params[:id])
  end

  # POST /notify_observer_properties
  # POST /notify_observer_properties.json
  def create
    @notify_observer_property = NotifyObserverProperty.new(params[:notify_observer_property])

    respond_to do |format|
      if @notify_observer_property.save
        format.html { redirect_to @notify_observer_property, :notice => 'Event property was successfully created.' }
        format.json { render :json => @notify_observer_property, :status => :created, :location => @notify_observer_property }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notify_observer_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notify_observer_properties/1
  # PUT /notify_observer_properties/1.json
  def update
    @notify_observer_property = NotifyObserverProperty.find(params[:id])

    respond_to do |format|
      if @notify_observer_property.update_attributes(params[:notify_observer_property])
        format.html { redirect_to @notify_observer_property, :notice => 'Event property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notify_observer_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_observer_properties/1
  # DELETE /notify_observer_properties/1.json
  def destroy
    @notify_observer_property = NotifyObserverProperty.find(params[:id])
    @notify_observer_property.destroy

    respond_to do |format|
      format.html { redirect_to notify_observer_properties_url }
      format.json { head :no_content }
    end
  end
end
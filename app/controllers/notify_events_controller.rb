class NotifyEventsController < ApplicationController
  # GET /notify_events
  # GET /notify_events.json
  def index
    @notify_events = NotifyEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notify_events }
    end
  end

  # GET /notify_events/1
  # GET /notify_events/1.json
  def show
    @notify_event = NotifyEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify_event }
    end
  end

  # GET /notify_events/new
  # GET /notify_events/new.json
  def new
    @notify_event = NotifyEvent.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify_event }
    end
  end

  # GET /notify_events/1/edit
  def edit
    puts "*******************************"
    @notify_event = NotifyEvent.find(params[:id])
    @mapping = Mapping.where("notify_template_id=?", @notify_event.notify_template_id)
    puts "*"*300
    puts @mapping.inspect
    puts "*"*300
    parameters = []
    @mapping.select("template_parameter").each do |parpar|
      parameters << parpar.template_parameter
    end

    @parameters = parameters

    if @notify_event.notify_observer_id != nil
      properties = NotifyObserverProperty.where("notify_observer_id=?",@notify_event.notify_observer_id.to_i)
      options = properties.collect{ |el| [el.name, el.id, {complex: false}] }
    else
      properties = Resource.select("resource_types.name").select("resources.id").select("resources.description").joins(:resource_type, :event_resources).where("event_id=?",@notify_event.event_id.to_i)
      options = properties.collect{ |el| [el.name, el.id, {complex: true}] }
    end

    @options = options

    puts @notify_event.inspect
    puts @mapping.inspect
    puts "*******************************"
  end

  # POST /notify_events
  # POST /notify_events.json
  def create
    #raise params.inspect
    recipients = params[:notify_event].delete(:recipients_attributes) || []
    puts "*"*300
    puts recipients.inspect
    puts "*"*300
    mappings = params[:notify_event].delete(:mappings_attributes) || []
    puts mappings.inspect
    success = false

#raise mappings.inspect
    #raise recipients.inspect
    # TODO: move to model and separeate to form layer
    ActiveRecord::Base.transaction do
      @notify_event = NotifyEvent.new(params[:notify_event])
      success = @notify_event.save
      puts "success.inspect:"+success.inspect
      
      recipients.each do |recipient|
        r = Recipient.new(recipient)
        r.notify_event = @notify_event
        success = success && r.save
      end

      template_ = NotifyTemplate.find(params[:notify_event][:notify_template_id])
      mappings.each do |mapping|
        m = Mapping.new()
        str=""
        mapping["notify_observer_property_id"].each do |map|
          str << map["properties"]+","
        end
        if params["event"]=="Event"
          m.resource_id =  str[0..-2]
        else
          m.notify_observer_property_id = str[0..-2]
        end
        m.template_parameter = mapping["template_parameter"]
        m.notify_template = template_
        success = success && m.save
      end

    end
      #raise params.inspect    
    respond_to do |format|
      if success
        #NotifyEventMailer.notify_event_email.deliver
        format.html { redirect_to @notify_event, :notice => 'Notify event was successfully created.' }
        format.json { render :json => @notify_event, :status => created, :location => @notify_event }
      else
        #raise @notify_event.errors.inspect
        format.html { render :action => "new", :notice => 'Notify event was not successfully created.'}
        format.json { render :json => @notify_event.errors, :status => unprocessable_entity }
      end
    end
  end

  # PUT /notify_events/1
  # PUT /notify_events/1.json
  def update
    @notify_event = NotifyEvent.find(params[:id])

    respond_to do |format|
      if @notify_event.update_attributes(params[:notify_event])
        format.html { redirect_to @notify_event, :notice => 'Notify event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notify_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_events/1
  # DELETE /notify_events/1.json
  def destroy
    @notify_event = NotifyEvent.find(params[:id])
    @notify_event.destroy

    respond_to do |format|
      format.html { redirect_to notify_events_url }
      format.json { head :no_content }
    end
  end


  #TODO: move to model
  def show_property_mapping_content
    template = NotifyTemplate.find(params[:notify_template_id].to_i)
    parameters = template.body.scan(/\$\$\{([0-9a-zA-Z_-]+)\}/).flatten
    if params[:notify_observer_id] != ""
      properties = NotifyObserverProperty.where("notify_observer_id=?",params[:notify_observer_id].to_i)
      options = properties.collect{ |el| [el.name, el.id, {complex: false}] }
    else
      properties = Resource.select("resource_types.name")
        .select("resources.id")
        .select("resources.description")
        .joins(:resource_type, :event_resources)
        .where("event_id=?", params[:event_id].to_i)
      options = properties.collect{ |el| [el.name, el.id, {complex: true}] }
    end
    render :partial => "notify_event_property_mapping", :collection => parameters, :as => 'parameter', :locals => {:options => options}, :layout => false
  end

  def show_property_by_resource_value
    params[:id] = ResourceValue.find(params[:id].to_i).resource_reference_id
    show_property_by_resource
  end

  def show_property_by_resource
    properties = Resource.find(params[:id].to_i).resource_type
      .fields_resource_values
      .select("resource_values.id")      
      .select("fields.name")
      .select("resource_values.resource_reference_id")
      .where("resource_id=?", params[:id].to_i)
    options = properties.collect{ |el| [el.name, el.id, {complex: !el.resource_reference_id.nil?}] } 
    render :partial => "property_by_resource_value", :locals => {:options => options}, :layout => false
  end

end
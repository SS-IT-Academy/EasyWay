require "awesome_print"
require 'paint'

class NotifyEventsController < ApplicationController
  # GET /notify_events
  # GET /notify_events.json
  def index
    @notify_events = NotifyEvent.all
    # raise "jhhkjhjkhjk"
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
    ap @notify_event
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify_event }
    end
  end

  # GET /notify_events/1/edit
  def edit
    @notify_event = NotifyEvent.find(params[:id])
    @mapping = Mapping.where("notify_template_id=?", @notify_event.notify_template_id)
    @recipients = Recipient.where("notify_event_id=?", @notify_event.id)
    ap @recipients

    @parameters = @mapping.collect{ |el| el.template_parameter}
    if @notify_event.with_observer?
      properties = NotifyObserverProperty.where("notify_observer_id=?", @notify_event.notify_observer_id.to_i)
      @options = properties.collect{ |el| [el.name, el.id, {complex: false}] }
      @selec = @mapping.collect{ |el| el.notify_observer_property_id}
      print @selec.inspect
    else
      properties = Resource.resources_by_event(@notify_event.event_id.to_i)
      # @options = [
      # [["Teachers", 1, {:complex=>true}], ["Teachers", 2, {:complex=>true}],["Persons", 3, {:complex=>true}]], 
      # [["Name of a Teacher", 1, {:complex=>false}]], 
      # [["Teachers", 1, {:complex=>true}], ["Teachers", 2, {:complex=>true}],["Persons", 3, {:complex=>true}]],
      # [["Name of a Person", 3, {:complex=>false}], ["Teacher of a Person C", 4, {:complex=>true}]],
      # [["Teachers", 1, {:complex=>true}], ["Teachers", 2, {:complex=>true}],["Persons", 3, {:complex=>true}]],
      # [["Name of a Person", 3, {:complex=>false}], ["Teacher of a Person C", 4, {:complex=>true}]],
      # [["Name of a Teacher", 1, {:complex=>false}]]
      # ]
      @options = properties.collect{ |el| [el.name, el.id, {complex: true}]}
      @selec = @mapping.collect{ |el| el.resource_id}
      @alloptions= []
      @selec.each do |el|
        @alloptions << @options
        @alloptions << Resource.resource_fields_with_values_by_resource(el.split(",").shift).collect{ |el| [el.name, el.id, {complex: !el.resource_reference_id.nil?}] }
        el.split(",")[1..-2].each do |el|
          @alloptions << Resource.resource_fields_with_values_by_resource(ResourceValue.find(el).resource_reference_id).collect{ |el| [el.name, el.id, {complex: !el.resource_reference_id.nil?}] }
        end
      end
      @options = @alloptions
      # ap @options, options = {:index => false, :multiline  => false}
      # print @selec.inspect
      # @all_options = [@options]
      # ResourceValue.find(params[:id].to_i).resource_reference_id
      # @selec.split(",").each do |el|
      #   @all_options << ResourceValue.find(el.to_i).resource_reference_id
      # end
    end

  end

  # POST /notify_events
  # POST /notify_events.json
  def create
    #raise params.inspect
    recipients = params[:notify_event].delete(:recipients_attributes) || []
    puts recipients.inspect
    mappings = params[:notify_event].delete(:mappings_attributes) || []
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
        r.group_number = recipient["group_number"]
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
        # NotifyEventMailer.notify_event_email(@notify_event).deliver
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
    
    # ap @notify_event, options = {:index => false, :multiline => true}
    #raise params.inspect
    recipients = params["notify_event"].delete("recipients_attributes")
    puts recipients.inspect
    mappings = params["notify_event"].delete("mappings_attributes")

    @notify_event = NotifyEvent.find(params["id"])
    @notify_event.event_id = nil
    @notify_event.notify_observer_id = nil
    @notify_event.update_attributes(params["notify_event"])
    
    Recipient.where("notify_event_id=?",params["id"]).each do |el|
      el.destroy
    end

    Mapping.where("notify_template_id=?", params["notify_event"]["notify_template_id"]).each do |el|
      el.destroy
    end

    recipients.each do |recipient|
      r = Recipient.new(recipient)
      r.group_number = recipient["group_number"]
      r.notify_event = @notify_event
      r.save
    end

    template_ = NotifyTemplate.find(params["notify_event"]["notify_template_id"])
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
      m.save
    end 

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
    ap @notify_event
    template = NotifyTemplate.find(params[:notify_template_id].to_i)
    parameters = template.body.scan(/\$\$\{([0-9a-zA-Z_-]+)\}/).flatten
    if params[:notify_observer_id] != ""
      properties = NotifyObserverProperty.where("notify_observer_id=?",params[:notify_observer_id].to_i)
      options = properties.collect{ |el| [el.name, el.id, {complex: false}] }
    else
      properties = Resource.resources_by_event(params[:event_id].to_i)
      options = options_for_parameters_mapping(properties){true}
    end
    render :partial => "notify_event_property_mapping", :collection => parameters, :as => 'parameter', :locals => {:options => options}, :layout => false
  end

  def show_property_by_resource_value
    params[:id] = ResourceValue.find(params[:id].to_i).resource_reference_id
    show_property_by_resource
  end

  def show_property_by_resource
    properties = Resource.resource_fields_with_values_by_resource(params[:id].to_i)
    options = properties.collect{ |el| [el.name, el.id, {complex: !el.resource_reference_id.nil?}] }
    # options = options_for_parameters_mapping(properties){!el.resource_reference_id.nil?}
    render :partial => "property_by_resource_value", :locals => {:options => options}, :layout => false
  end

  private

  def options_for_parameters_mapping(properties)
    properties.collect{ |el| [el.name, el.id, {complex: yield}] } 
  end  

end
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
    @notify_event = NotifyEvent.find(params[:id])
  end

  # POST /notify_events
  # POST /notify_events.json
  def create
    #raise params.inspect
    recipients = params[:notify_event].delete(:recipients_attributes) || []
 
    mappings = params[:notify_event].delete(:mappings_attributes) || []
    success = false

#raise mappings.inspect
    #raise recipients.inspect
    # TODO: move to model and separeate to form layer
    ActiveRecord::Base.transaction do
      @notify_event = NotifyEvent.new(params[:notify_event])
      success = @notify_event.save
      
      recipients.each do |recipient|
        r = Recipient.new(recipient)
        r.notify_event = @notify_event
        success = success && r.save
      end
      
      template_ = NotifyTemplate.find(params[:notify_event][:notify_template_id])
      mappings.each do |mapping|
        m = Mapping.new(mapping)
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
        format.html { render :action => "new" }
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
      puts "*"*300
    template = NotifyTemplate.find(params[:notify_template_id].to_i)
    parameters = template.body.scan(/\$\$\{([0-9a-zA-Z_-]+)\}/).flatten
      puts "template: #{template.inspect}" 
      puts "parameters: #{parameters.inspect}"
    # observer_propertie = NotifyObserverProperty.find(params[:notify_observer_id].to_i)
    properties = NotifyObserverProperty.where("notify_observer_id=?",params[:notify_observer_id].to_i)
    # properties = NotifyObserverProperty.where("notify_observer_id=?",params[:notify_observer_id].to_i)
      #puts "observer_propertie: #{observer_propertie.inspect}" 
      puts "property: #{properties.inspect}"
    render :partial => "notify_event_property_mapping", :collection => parameters, :as => 'parameter', :locals => {:properties => properties}, :layout => false
      puts "*"*300
  end 
end

class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    @resource_types = ResourceType.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  def some_records
    @resources = Resource.by_resource_type(params[:resource_type_id])
    render :json => @resources.to_json
  end
  
  def update_resources
    if params[:resource_type_id] == ''
      @resources = Resource.all
      render :partial => "resources_filter", :object => @resource
    else
      @resources = Resource.by_resource_type(params[:resource_type_id])
      render :partial => "resources_filter", :object => @resource
    end
  end
  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @resource_type = ResourceType.find(@resource.resource_type_id)
    @values = ResourceValue.where("resource_id = ?", params[:id])
    @field_types = []
    @values.each do |value|
      if value.field.resource_type_reference_id
        @field_types << Resource.find(value.resource_reference_id).resource_type
      else
        @field_types << value.field.field_type
      end
    end     
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new
    @resource_types = ResourceType.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end
  

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @resource_types = ResourceType.all
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.create(params[:resource])
    if params[:fields]
      params[:fields].each do |param|
        @rv = @resource.resource_values.build(
          :field_id              => param[:field_id], 
          :value                 => param[:value],
          :resource_reference_id => param[:resource_reference_id]
        )
      end
    end        
    respond_to do |format|
      if @resource.save
        @resource.eval_description
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])
    if @resource.assign_attributes(params[:resource])
      params[:values].each do |param|
        if param[:id]
          @rv = ResourceValue.find(param[:id])
          @rv.assign_attributes(
            :value                 => param[:value], 
            :field_id              => param[:field_id],
            :resource_reference_id => param[:resource_reference_id]
          )
        else
          @rv = @resource.resource_values.build(
            :value                 => param[:value], 
            :field_id              => param[:field_id],
            :resource_reference_id => param[:resource_reference_id], 
          )
        end
      end
    end  
    respond_to do |format|
      if @resource.save
        @resource.eval_description
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
  
  def add_event_resources
    @resources = Resource.all
    render :json => @resources.to_json
  end

  def resource_info
    @resource = Resource.find(params[:id])
    @resource_type = @resource.resource_type.name;
    @values = @resource.resource_values
    @field_names = []

    @values.each_with_index do |value,i|
      @field_names[i] = value.field.name
    end

    respond_to do |format|
      format.json {
        render :json => {
          :resource      => @resource,
          :resource_type => @resource_type, 
          :values        => @values,
          :field_names   => @field_names
        }
      }
    end
  end
end

class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    @resource_types=ResourceType.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end
  def some_records
    @resources = Resource.where("resource_type_id = ?", params[:resource_type_id])
    render :json => @resources.to_json
  end
  
  def update_resources
    if (params[:resource_type_id] == '') then
      @resources = Resource.all
      render :partial => "resources_filter", :object => @resource
    else
      @resources = Resource.where("resource_type_id = ?", params[:resource_type_id])
      render :partial => "resources_filter", :object => @resource
    end
  end
  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @resource_type = ResourceType.find(@resource.resource_type_id)
    @values = ResourceValue.where(resource_id: params[:id])
    @field_types=[]
    @values.each do |value|
      @field_types << value.Field
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
    @resource_types=ResourceType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end
  

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @resource_types=ResourceType.all
    @resource_values = ResourceValue.where("resource_id = ?", params[:id])
    @field_names=[]
    @resource_values.each_with_index do |value, i|
      @field_names[i] = Field.find(value.field_id).name 
    end  
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        params[:fields].each {|param|
          @fields = ResourceValue.new({:field_id => param[:field_id], :value => param[:value],:resource_id => @resource.id})
          @fields.save
        }
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        params[:values].each {|param|
          @value = ResourceValue.find(param[:id])
          @value.update_attributes({:value => param[:value], :field_id => param[:field_id], :resource_id => params[:id]})
        }
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
end

class ResourceTypesController < ApplicationController
  # GET /resource_types
  # GET /resource_types.json
  def index
    @resource_types = ResourceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_types }
    end
  end
  
  def all_types
    @resource_types = ResourceType.all
    render :json => @resource_types.to_json
  end
  # GET /resource_types/1
  # GET /resource_types/1.json
  def show
    @resource_type = ResourceType.find(params[:id])
    @resource_fields = Field.where("resource_type_id = ?", params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_type }
    end
  end

  # GET /resource_types/new
  # GET /resource_types/new.json
  def new
    @resource_type = ResourceType.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_type }
    end
  end
  
  def update_fields
    @fields = Field.where("resource_type_id = ?", params[:resource_type_id])
    render :json => @fields.to_json
  end
  # GET /resource_types/1/edit
  def edit
    @resource_type = ResourceType.find(params[:id])
    @resource_fields = Field.where("resource_type_id = ?", params[:id])
    @field_types = FieldType.all
    @resource_types = ResourceType.all
  end

  # POST /resource_types
  # POST /resource_types.jsojoins(:field_type)n
  def create
    @resource_type = ResourceType.new(params[:resource_type])
    respond_to do |format|
      if @resource_type.save
        params[:fields].each {|param|
          @fields = Field.new({:name => param[:name], :field_type_id => param[:field_type_id],:resource_type_id => @resource_type.id, :resource_type_reference_id =>param[:resource_type_reference_id]})
          @fields.save
        }
        format.html { redirect_to @resource_type, notice: 'Resource type was successfully created.' }
        format.json { render json: @resource_type, status: :created, location: @resource_type }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resouresource_type_reference_idrce_types/1
  # PUT /resource_types/1.json
  def update
    @resource_type = ResourceType.find(params[:id])
    respond_to do |format|
      if @resource_type.update_attributes(params[:resource_type])
        params[:fields].each{|param|
          if param[:id]
            @field = Field.find(param[:id])
            @field.update_attributes({:name => param[:name], :field_type_id => param[:field_type_id],:resource_type_id => params[:id], :resource_type_reference_id => param[:reference_type_id]})
          else
            @field = Field.new({:name => param[:name], :field_type_id => param[:field_type_id],:resource_type_id => params[:id]})
          end
          @field.save
          }
        format.html { redirect_to @resource_type, notice: 'Resource type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_types/1
  # DELETE /resource_types/1.json
  def destroy
    @resource_type = ResourceType.find(params[:id])
    if @resource_type.destroy
      respond_to do |format|
        format.html { redirect_to resource_types_url }
        format.json { head :no_content }
      end
    else
        format.html { redirect_to @resource_type, notice: "Resource don't delete." }
    end
  
  end
end

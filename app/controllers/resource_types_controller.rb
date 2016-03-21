class ResourceTypesController < ApplicationController
  before_filter :get_resource_type,  only: [:show, :edit, :update, :destroy, :description]
  before_filter :get_resource_types, only: [:index, :all_types, :edit]

  # GET /resource_types
  # GET /resource_types.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_types }
    end
  end
  
  def all_types
    render :json => @resource_types.to_json
  end
  # GET /resource_types/1
  # GET /resource_types/1.json
  def show
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
  
  def get_restype_fields
    @restype_fields = Field.where("resource_type_id = ?", params[:resource_type_id])
    render :json => @restype_fields.to_json
  end
  
  # GET /resource_types/1/edit
  def edit
    @resource_fields = Field.where("resource_type_id = ?", params[:id])
    @field_types = FieldType.all
    @validators = Validator.all
  end

  # POST /resource_types
  # POST /resource_types.jsojoins(:field_type)n
  def create
    puts "#" * 40, params[:fields], "#" * 40
    @resource_type = ResourceType.new(params[:resource_type])
    respond_to do |format|
      if @resource_type.save
        if params[:fields]
          params[:fields].each do |param|
            @field = Field.new(
              :name                       => param[:name], 
              :field_type_id              => param[:field_type_id],
              :resource_type_id           => @resource_type.id, 
              :resource_type_reference_id => param[:resource_type_reference_id]
            )
            param[:validator_ids].each do |index|
              @field.field_validations.build(validator_id: index)
            end
            @field.save
          end
        end
        format.html { redirect_to @resource_type, notice: 'Resource type was successfully created.' }
        format.json { render json: @resource_type, status: :created, location: @resource_type }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def description
    if @resource_type.update_attributes(params[:resource_type])
      redirect_to resource_types_url, notice: 'Description was successfully updated.'   
    else
      render 'show'
    end 
  end

  # PUT /resouresource_type_reference_idrce_types/1
  # PUT /resource_types/1.json
  def update
    respond_to do |format|
      if @resource_type.update_attributes(params[:resource_type])
        if params[:fields]
          params[:fields].each do |param|
            if param[:id]
              @field = Field.find(param[:id])
              @field.update_attributes(
                :name                       => param[:name], 
                :field_type_id              => param[:field_type_id],
                :resource_type_id           => params[:id],
                :resource_type_reference_id => param[:resource_type_reference_id]
              )
            else
              @field = Field.create(
                :name             => param[:name],
                :field_type_id    => param[:field_type_id],
                :resource_type_id => params[:id],
                :resource_type_reference_id => param[:resource_type_reference_id]
              )
            end
            if @field.field_validations.any?
              @field.field_validations.each { |v| v.destroy }
            end
            if param[:validator_ids]
              param[:validator_ids].each do |index|
                next if index == "multiselect-all"
                @field.field_validations.build(validator_id: index.to_i)
              end
            end            
            @field.save
          end
        end  
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
    begin
      if @resource_type.destroy
        respond_to do |format|
          format.html { redirect_to resource_types_url }
          format.json { head :no_content }
        end
      end  
    rescue
      respond_to do |format|
        format.html { redirect_to "index", notice: "Resource_type cann't delete." }
      end
    end
  end

  private 

  def get_resource_type
    @resource_type = ResourceType.find(params[:id])    
  end

  def get_resource_types
    @resource_types = ResourceType.all   
  end
end

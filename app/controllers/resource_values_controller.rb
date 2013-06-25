class ResourceValuesController < ApplicationController
  # GET /resource_values
  # GET /resource_values.json
  def index
    @resource_values = ResourceValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_values }
    end
  end

  # GET /resource_values/1
  # GET /resource_values/1.json
  def show
    @resource_value = ResourceValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_value }
    end
  end

  # GET /resource_values/new
  # GET /resource_values/new.json
  def new
    @resource_value = ResourceValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_value }
    end
  end

  # GET /resource_values/1/edit
  def edit
    @resource_value = ResourceValue.find(params[:id])
  end

  # POST /resource_values
  # POST /resource_values.json
  def create
    @resource_value = ResourceValue.new(params[:resource_value])

    respond_to do |format|
      if @resource_value.save
        format.html { redirect_to @resource_value, notice: 'Resource value was successfully created.' }
        format.json { render json: @resource_value, status: :created, location: @resource_value }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_values/1
  # PUT /resource_values/1.json
  def update
    @resource_value = ResourceValue.find(params[:id])

    respond_to do |format|
      if @resource_value.update_attributes(params[:resource_value])
        format.html { redirect_to @resource_value, notice: 'Resource value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_values/1
  # DELETE /resource_values/1.json
  def destroy
    @resource_value = ResourceValue.find(params[:id])
    @resource_value.destroy

    respond_to do |format|
      format.html { redirect_to resource_values_url }
      format.json { head :no_content }
    end
  end
end

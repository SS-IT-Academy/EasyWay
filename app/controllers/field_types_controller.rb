class FieldTypesController < ApplicationController
  # GET /field_types
  # GET /field_types.json
  def index
    @field_types = FieldType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @field_types }
    end
  end

  # GET /field_types/1
  # GET /field_types/1.json
  def show
    @field_type = FieldType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @field_type }
    end
  end

  # GET /field_types/new
  # GET /field_types/new.json
  def new
    @field_type = FieldType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @field_type }
    end
  end

  # GET /field_types/1/edit
  def edit
    @field_type = FieldType.find(params[:id])
  end

  # POST /field_types
  # POST /field_types.json
  def create
    @field_type = FieldType.new(params[:field_type])

    respond_to do |format|
      if @field_type.save
        format.html { redirect_to @field_type, notice: 'Field type was successfully created.' }
        format.json { render json: @field_type, status: :created, location: @field_type }
      else
        format.html { render action: "new" }
        format.json { render json: @field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /field_types/1
  # PUT /field_types/1.json
  def update
    @field_type = FieldType.find(params[:id])

    respond_to do |format|
      if @field_type.update_attributes(params[:field_type])
        format.html { redirect_to @field_type, notice: 'Field type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @field_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_types/1
  # DELETE /field_types/1.json
  def destroy
    @field_type = FieldType.find(params[:id])
    @field_type.destroy

    respond_to do |format|
      format.html { redirect_to field_types_url }
      format.json { head :no_content }
    end
  end
end

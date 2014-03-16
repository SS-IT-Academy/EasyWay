class ValidatorsController < ApplicationController
  # GET /validators
  # GET /validators.json
  def all_types
    @validators = Validator.where("field_type_id IS NULL OR field_type_id = ?", params["field_type_id"].to_i)
    puts "#" * 40, params["field_type_id"].class, "#" * 40
    render :json => @validators.to_json
  end

  def index
    @validators = Validator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @validators }
    end
  end

  # GET /validators/1
  # GET /validators/1.json
  def show
    @validator = Validator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validator }
    end
  end

  # GET /validators/new
  # GET /validators/new.json
  def new
    @validator = Validator.new
    @field_types = FieldType.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @validator }
    end
  end

  # GET /validators/1/edit
  def edit
    @validator = Validator.find(params[:id])
    @field_types = FieldType.all
  end

  # POST /validators
  # POST /validators.json
  def create
    @validator = Validator.new(params[:validator])

    respond_to do |format|
      if @validator.save
        format.html { redirect_to @validator, notice: 'Validator was successfully created.' }
        format.json { render json: @validator, status: :created, location: @validator }
      else
        format.html { render action: "new" }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /validators/1
  # PUT /validators/1.json
  def update
    @validator = Validator.find(params[:id])

    respond_to do |format|
      if @validator.update_attributes(params[:validator])
        format.html { redirect_to @validator, notice: 'Validator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @validator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validators/1
  # DELETE /validators/1.json
  def destroy
    @validator = Validator.find(params[:id])
    @validator.destroy

    respond_to do |format|
      format.html { redirect_to validators_url }
      format.json { head :no_content }
    end
  end
end

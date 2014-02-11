class FieldValidationsController < ApplicationController
  # GET /field_validations
  # GET /field_validations.json
  def index
    @field_validations = FieldValidation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @field_validations }
    end
  end

  # GET /field_validations/1
  # GET /field_validations/1.json
  def show
    @field_validation = FieldValidation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @field_validation }
    end
  end

  # GET /field_validations/new
  # GET /field_validations/new.json
  def new
    @field_validation = FieldValidation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @field_validation }
    end
  end

  # GET /field_validations/1/edit
  def edit
    @field_validation = FieldValidation.find(params[:id])
  end

  # POST /field_validations
  # POST /field_validations.json
  def create
    @field_validation = FieldValidation.new(params[:field_validation])

    respond_to do |format|
      if @field_validation.save
        format.html { redirect_to @field_validation, notice: 'Field validation was successfully created.' }
        format.json { render json: @field_validation, status: :created, location: @field_validation }
      else
        format.html { render action: "new" }
        format.json { render json: @field_validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /field_validations/1
  # PUT /field_validations/1.json
  def update
    @field_validation = FieldValidation.find(params[:id])

    respond_to do |format|
      if @field_validation.update_attributes(params[:field_validation])
        format.html { redirect_to @field_validation, notice: 'Field validation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @field_validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_validations/1
  # DELETE /field_validations/1.json
  def destroy
    @field_validation = FieldValidation.find(params[:id])
    @field_validation.destroy

    respond_to do |format|
      format.html { redirect_to field_validations_url }
      format.json { head :no_content }
    end
  end
end

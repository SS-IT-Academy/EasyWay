class NotifyTemplatesController < ApplicationController
  # GET /notify_templates
  # GET /notify_templates.json
  def index
    @notify_templates = NotifyTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notify_templates }
    end
  end

  # GET /notify_templates/1
  # GET /notify_templates/1.json
  def show
    @notify_template = NotifyTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify_template }
    end
  end

  # GET /notify_templates/new
  # GET /notify_templates/new.json
  def new
    @notify_template = NotifyTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notify_template }
    end
  end

  # GET /notify_templates/1/edit
  def edit
    @notify_template = NotifyTemplate.find(params[:id])
  end

  # POST /notify_templates
  # POST /notify_templates.json
  def create
    @notify_template = NotifyTemplate.new(params[:notify_template])

    respond_to do |format|
      if @notify_template.save
        format.html { redirect_to @notify_template, notice: 'Notify template was successfully created.' }
        format.json { render json: @notify_template, status: :created, location: @notify_template }
      else
        format.html { render action: "new" }
        format.json { render json: @notify_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notify_templates/1
  # PUT /notify_templates/1.json
  def update
    @notify_template = NotifyTemplate.find(params[:id])

    respond_to do |format|
      if @notify_template.update_attributes(params[:notify_template])
        format.html { redirect_to @notify_template, notice: 'Notify template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notify_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_templates/1
  # DELETE /notify_templates/1.json
  def destroy
    @notify_template = NotifyTemplate.find(params[:id])
    @notify_template.destroy

    respond_to do |format|
      format.html { redirect_to notify_templates_url }
      format.json { head :no_content }
    end
  end
end

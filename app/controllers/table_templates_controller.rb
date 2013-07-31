class TableTemplatesController < ApplicationController
  def index
    @table_templates = TableTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_templates }
    end
  end
  def show
    @table_template = TableTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_template }
    end
  end
  def new
    @table_template = TableTemplate.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_template }
    end
  end
  def edit
    @table_template = TableTemplate.find(params[:id])
    @horizontal_table_headers = TableHeader.horizontal_headers(@table_template.id)
    @vertical_table_headers = TableHeader.vertical_headers(@table_template.id)   
    @headers_hor = TableHeader.where("table_template_id = ? AND orientation = ?", params[:id], "horizontal").order(:position_num)
    if @headers_hor.first
      @resources_hor = Resource.where("resource_type_id = ?", @headers_hor.first.resource_type_id)      
    end
  end
  def create
    @table_template = TableTemplate.new(params[:table_template])
    respond_to do |format|
      if @table_template.save
        format.html { redirect_to edit_table_template_path(@table_template), notice: 'Table template was successfully created.' }
        format.json { render json: @table_template, status: :created, location: @table_template }
      else
        format.html { render action: "new" }
        format.json { render json: @table_template.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @table_template = TableTemplate.find(params[:id])
    respond_to do |format|
      if @table_template.update_attributes(params[:table_template])
        format.html { redirect_to @table_template, notice: 'Table template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_template.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @table_template = TableTemplate.find(params[:id])
    @table_template.destroy
    respond_to do |format|
      format.html { redirect_to table_templates_url }
      format.json { head :no_content }
    end
  end
end

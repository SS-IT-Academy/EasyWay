class TableTemplatesController < ApplicationController
  # GET /table_templates
  # GET /table_templates.json
  def index
    @table_templates = TableTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_templates }
    end
  end

  # GET /table_templates/1
  # GET /table_templates/1.json
  def show
    @table_template = TableTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_template }
    end
  end

  # GET /table_templates/new
  # GET /table_templates/new.json
  def new
    @table_template = TableTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_template }
    end
  end

  # GET /table_templates/1/edit
  def edit
    #puts "^"*30
    @table_template = TableTemplate.find(params[:id])
    #puts "@table_template: #{@table_template.inspect}"
    @horizontal_table_headers = TableHeader.horizontal_headers(@table_template.id)
    @hth = @horizontal_table_headers
    #puts "@horizontal_table_headers: #{@horizontal_table_headers.inspect}" 
    #puts "horizontal nested: #{@horizontal_table_headers.first.resource_type.inspect}"  
    @vertical_table_headers = TableHeader.vertical_headers(@table_template.id)
    #puts "@vertical_table_headers: #{@vertical_table_headers.inspect}"
    #puts "vertical nested: #{@vertical_table_headers.first.resource_type.inspect}" 
  end

  # POST /table_templates
  # POST /table_templates.json
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

  # PUT /table_templates/1
  # PUT /table_templates/1.json
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

  # DELETE /table_templates/1
  # DELETE /table_templates/1.json
  def destroy
    @table_template = TableTemplate.find(params[:id])
    @table_template.destroy

    respond_to do |format|
      format.html { redirect_to table_templates_url }
      format.json { head :no_content }
    end
  end
end

class TableHeadersController < ApplicationController

  def index
    @table_headers = TableHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_headers }
    end
  end

  def show
    @table_header = TableHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_header }
    end
  end

  def new
    @table_header = TableHeader.new
    @table_header.orientation =  params[:orientation] if TableHeader::ORIENTATIONS.include?(params[:orientation])
    @table_template = TableTemplate.find(params[:table_template_id])

    @cur_headers = TableHeader
    .where("table_template_id = ?", params[:table_template_id])
    .where("orientation = ?", params[:orientation])
    .order(:position_num)
    if (@cur_headers.blank?)
      @resource_types = ResourceType.all
      @table_header.position_num = 1
    else
      @table_header.position_num = @cur_headers.last.position_num+1
      @fields = Field.where("resource_type_reference_id = ?", @cur_headers.last.resource_type_id)
      @resource_types = []
      @fields.each do |f|
        @resource_types << f.resource_type
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_header }
    end
  end

  def edit
    @table_header = TableHeader.find(params[:id])
    @resource_types = ResourceType.all
  end

  def create
    @table_header = TableHeader.new(params[:table_header])
    respond_to do |format|
      if @table_header.save
        flash[:notice] = 'Table header was successfully created.'
        format.html { redirect_to( :controller => "table_templates", :action => "edit", :id => params[:table_header][:table_template_id])}
        format.json { render json: @table_header, status: :created, location: @table_header }
      else
        flash[:error] = "Table header was not created. #{@table_header.errors.messages}"
        format.html { redirect_to( action: "new", table_template_id: params[:table_header][:table_template_id] ) }
        format.json { render json: @table_header.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @table_header = TableHeader.find(params[:id])

    respond_to do |format|
      if @table_header.update_attributes(params[:table_header])
        format.html { redirect_to @table_header, notice: 'Table header was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_header.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @table_header = TableHeader.find(params[:id])
    @table_header.destroy
    respond_to do |format|
      format.html { redirect_to edit_table_template_path(@table_header.table_template_id) }
      format.json { head :no_content }
    end
  end

end

class TableHeadersController < ApplicationController
  # GET /table_headers
  # GET /table_headers.json
  def index
    @table_headers = TableHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_headers }
    end
  end

  # GET /table_headers/1
  # GET /table_headers/1.json
  def show
    @table_header = TableHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_header }
    end
  end

  # GET /table_headers/new
  # GET /table_headers/new.json
  def new
    @table_header = TableHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_header }
    end
  end

  # GET /table_headers/1/edit
  def edit
    @table_header = TableHeader.find(params[:id])
  end

  # POST /table_headers
  # POST /table_headers.json
  def create
    @table_header = TableHeader.new(params[:table_header])

    respond_to do |format|
      if @table_header.save
        format.html { redirect_to @table_header, notice: 'Table header was successfully created.' }
        format.json { render json: @table_header, status: :created, location: @table_header }
      else
        format.html { render action: "new" }
        format.json { render json: @table_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_headers/1
  # PUT /table_headers/1.json
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

  # DELETE /table_headers/1
  # DELETE /table_headers/1.json
  def destroy
    @table_header = TableHeader.find(params[:id])
    @table_header.destroy

    respond_to do |format|
      format.html { redirect_to table_headers_url }
      format.json { head :no_content }
    end
  end
end

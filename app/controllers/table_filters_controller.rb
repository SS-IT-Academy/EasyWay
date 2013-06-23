class TableFiltersController < ApplicationController
  # GET /table_filters
  # GET /table_filters.json
  def index
    @table_filters = TableFilter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_filters }
    end
  end

  # GET /table_filters/1
  # GET /table_filters/1.json
  def show
    @table_filter = TableFilter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_filter }
    end
  end

  # GET /table_filters/new
  # GET /table_filters/new.json
  def new
    @table_filter = TableFilter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_filter }
    end
  end

  # GET /table_filters/1/edit
  def edit
    @table_filter = TableFilter.find(params[:id])
  end

  # POST /table_filters
  # POST /table_filters.json
  def create
    @table_filter = TableFilter.new(params[:table_filter])

    respond_to do |format|
      if @table_filter.save
        format.html { redirect_to @table_filter, notice: 'Table filter was successfully created.' }
        format.json { render json: @table_filter, status: :created, location: @table_filter }
      else
        format.html { render action: "new" }
        format.json { render json: @table_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_filters/1
  # PUT /table_filters/1.json
  def update
    @table_filter = TableFilter.find(params[:id])

    respond_to do |format|
      if @table_filter.update_attributes(params[:table_filter])
        format.html { redirect_to @table_filter, notice: 'Table filter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_filters/1
  # DELETE /table_filters/1.json
  def destroy
    @table_filter = TableFilter.find(params[:id])
    @table_filter.destroy

    respond_to do |format|
      format.html { redirect_to table_filters_url }
      format.json { head :no_content }
    end
  end
end

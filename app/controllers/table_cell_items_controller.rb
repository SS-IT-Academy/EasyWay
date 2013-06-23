class TableCellItemsController < ApplicationController
  # GET /table_cell_items
  # GET /table_cell_items.json
  def index
    @table_cell_items = TableCellItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_cell_items }
    end
  end

  # GET /table_cell_items/1
  # GET /table_cell_items/1.json
  def show
    @table_cell_item = TableCellItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_cell_item }
    end
  end

  # GET /table_cell_items/new
  # GET /table_cell_items/new.json
  def new
    @table_cell_item = TableCellItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_cell_item }
    end
  end

  # GET /table_cell_items/1/edit
  def edit
    @table_cell_item = TableCellItem.find(params[:id])
  end

  # POST /table_cell_items
  # POST /table_cell_items.json
  def create
    @table_cell_item = TableCellItem.new(params[:table_cell_item])

    respond_to do |format|
      if @table_cell_item.save
        format.html { redirect_to @table_cell_item, notice: 'Table cell item was successfully created.' }
        format.json { render json: @table_cell_item, status: :created, location: @table_cell_item }
      else
        format.html { render action: "new" }
        format.json { render json: @table_cell_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_cell_items/1
  # PUT /table_cell_items/1.json
  def update
    @table_cell_item = TableCellItem.find(params[:id])

    respond_to do |format|
      if @table_cell_item.update_attributes(params[:table_cell_item])
        format.html { redirect_to @table_cell_item, notice: 'Table cell item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_cell_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_cell_items/1
  # DELETE /table_cell_items/1.json
  def destroy
    @table_cell_item = TableCellItem.find(params[:id])
    @table_cell_item.destroy

    respond_to do |format|
      format.html { redirect_to table_cell_items_url }
      format.json { head :no_content }
    end
  end
end

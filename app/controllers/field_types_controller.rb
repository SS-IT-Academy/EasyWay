class FieldTypesController < ApplicationController
  def new
    @field_type = FieldType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @field_type }
    end  
  end

  def create
    @field_type = FieldType.new(params[:field_type])
  end
end
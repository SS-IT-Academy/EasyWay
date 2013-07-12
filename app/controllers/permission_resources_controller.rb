class PermissionResourcesController < ApplicationController
  # GET /permission_resources
  # GET /permission_resources.json
  def index
    @permission_resources = PermissionResource.all
    @resource_types = ResourceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permission_resources }
    end
  end

  # GET /permission_resources/1
  # GET /permission_resources/1.json
  def show
    @permission_resource = PermissionResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permission_resource }
    end
  end

  # GET /permission_resources/new
  # GET /permission_resources/new.json
  def new
    @permission_resource = PermissionResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permission_resource }
    end
  end

  # GET /permission_resources/1/edit
  def edit
    @permission_resource = PermissionResource.find(params[:id])
  end

  # POST /permission_resources
  # POST /permission_resources.json
  def create
    @permission_resource = PermissionResource.new(params[:permission_resource])

    respond_to do |format|
      if @permission_resource.save
        format.html { redirect_to @permission_resource, notice: 'Permission resource was successfully created.' }
        format.json { render json: @permission_resource, status: :created, location: @permission_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @permission_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permission_resources/1
  # PUT /permission_resources/1.json
  def update
    @permission_resource = PermissionResource.find(params[:id])

    respond_to do |format|
      if @permission_resource.update_attributes(params[:permission_resource])
        format.html { redirect_to @permission_resource, notice: 'Permission resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permission_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_resources/1
  # DELETE /permission_resources/1.json
  def destroy
    @permission_resource = PermissionResource.find(params[:id])
    @permission_resource.destroy

    respond_to do |format|
      format.html { redirect_to permission_resources_url }
      format.json { head :no_content }
    end
  end
end

def update_permroles_fields
  @permissionresource = PermissionResource.where("role_id = ?", params[:role_id])
  render :json => @permissionresource.to_json
  end




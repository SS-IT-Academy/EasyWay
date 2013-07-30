class PermissionRolesController < ApplicationController
  # GET /permission_resources
  # GET /permission_resources.json
  def index
    @permissionable = find_permissionable
 #   affected_tmodels = %w{Resource, ResourceType, TableTemplates}
  #  @rows = {}
   # affected_tmodels.each |model| do
    #  rows[model] = model.classify.constantize.find_all
   # end
    @data = {}
    PermissionRole.with_role(params[:role_id]).each do |perm_role|
      @data[perm_role.permissionable_type] ||= {}
      @data[perm_role.permissionable_type][perm_role.permissionable_id] ||= []
      @data[perm_role.permissionable_type][perm_role.permissionable_id] << perm_role.permissions_id
    end
    @permissions = Permission.all  
    @resources = Resource.all
    @resource_types = ResourceType.all
 #   @permissionable = @permissionable.permission_role
  end
  

  # GET /permission_resources/1
  # GET /permission_resources/1.json
  def show
    @permission_role = PermissionRole.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permission_role }
    end
  end

  # GET /permission_resources/new
  # GET /permission_resources/new.json
  def new
    @permission_role = PermissionRole.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permission_role }
    end
  end

  # GET /permission_resources/1/edit
  def edit
    @permission_role = PermissionRole.find(params[:id])
  end

  # POST /permission_resources
  # POST /permission_resources.json
  def create
    @permission_roles = params[:permission_role]
    @current_permission_roles = {}
    @role_id = params[:roles_id]
    PermissionRole.with_role(@role_id).each do |el|
      @current_permission_roles[el.permissionable_id] ||= []
      @current_permission_roles[el.permissionable_id] << {"#{el.permission_id}" => "#{el.id}"}
    end
    records_to_delete = []
    create_perm_roles_array = []
    @permission_roles[:ResourceType].each do |k,v|
      if @current_permission_roles.has_key?(k)
        # find records that should be deleted       
        records_to_delete << (@current_permission_roles[k].keys - v).collect{|permission_id| @current_permission_roles[k][permission_id]}
        # find and create objects that should be created
        (v - @current_permission_roles[k].keys).collect do |permission_id|
          create_perm_roles_array << PermissionRole.new( 
            :roles_id => @role_id, 
            :permissions_id => permission_id,
            :permissionable_id => k,
            :permissionable_type => "ResourceType"
          )
        end # collect do
      else
        v.collect do |permission_id|
          create_perm_roles_array << PermissionRole.new( 
            :roles_id => @role_id, 
            :permissions_id => permission_id,
            :permissionable_id => k,
            :permissionable_type => "ResourceType"
          )
        end # collect do     
      end # if
    end
    PermissionRole.transaction do
      PermissionRole.destroy_all(:id => records_to_delete.flatten)
        create_perm_roles_array.flatten.each{|obj| 
        raise ActiveRecord::Rollback unless obj.save
      }
    end  

=begin    
    @permissionable = find_permissionable
    if (:params["permission_role[ResourceType][#{resource_type.id}]"] == 'selected') 
    @permissionrole = @permissionable.permissionrole.build(params[:permission_role])
    end
    if @permissionrole.save
      flash[:notice] = "Successfully created."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
=end
  end

  # PUT /permission_resources/1
  # PUT /permission_resources/1.json
  def update
    @permission_role = PermissionRole.find(params[:id])
 
    respond_to do |format|
      if @permission_role.update_attributes(params[:permission_role])
        format.html { redirect_to @permission_role, notice: 'Permission resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permission_role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def delete_from_db
    @cheched = PermissionRole.find(params[:permissionable][:id])
    @checked.each { |t| t.destroy }
  end
  # DELETE /permission_resources/1
  # DELETE /permission_resources/1.json
  def destroy
    @permission_role = PermissionRole.find(params[:id])
    @permission_role.destroy

    respond_to do |format|
      format.html { redirect_to permission_role_url }
      format.json { head :no_content }
    end
  end
  
  def update_permroles_fields
    @permissionrole = PermissionRole.where("role_id = ?", params[:role_id])
    render :json => @permissionrole.to_json
  end
end

private

def find_permissionable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end
  
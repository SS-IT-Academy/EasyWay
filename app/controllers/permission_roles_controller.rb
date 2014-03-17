class PermissionRolesController < ApplicationController
  # GET /permission_resources
  # GET /permission_resources.json
  def index
    @permissions = Permission.all.reject{|p| p.name == "Create" }
    @create_permission = Permission.where(name: "Create").first
    @resources = Resource.all
    @resource_types = ResourceType.all
    @permission_roles = PermissionRole.where(permissionable_id: nil)
    @current_role = Role.find(params[:role_id]) if params[:role_id].present?
    @current_role ||= Role.all.first
    render "index", layout: false if request.xhr?
  end

  def create
    PermissionRole.where(roles_id: params[:roles_id]).delete_all
    permission_roles = params[:permission_roles].select{|key, val| val[:permissionable_type].present?}
    PermissionRole.create permission_roles.values
  end
end
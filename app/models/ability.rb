class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roleid == 1
      can :manage, :all
    else
      Permission.where("name != 'Create'").each do |permission|
        can permission.name.downcase.to_sym, Resource do |permissionable_thing|
          user.role.permission_roles.select do |pr| 
            permission.id == pr.permissions_id && 
            pr.permissionable_type == permissionable_thing.resource_type.name
          end.map(&:permissionable_id).include?(permissionable_thing.id)
        end
      end
      can :create, Resource do |permissionable_thing|
        # user.role.permission_roles.where(permissionable_id: nil).select do |pr| 
        #   ap permissionable_thing
        #   pr.permissionable_type == permissionable_thing.resource_type.name
        # end
        true
      end
    end 
  end
end
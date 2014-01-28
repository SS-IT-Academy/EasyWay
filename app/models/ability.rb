class Ability

  include CanCan::Ability

  def initialize(user)
    puts "Before create Ability "*20
    puts "user: #{user.inspect}, role: #{user.role}"
    user ||= User.new # guest user (not logged in)
    if user.role.admin?
      can :manage, :all
    else
      user.role.permission_roles.each do |permission_role| 
        can permission_role.permission.name, permission_role.permissionable_type.constantize do |permissionable_thing|
           !permissionable_thing.nil? && !permission_role.permissionable_id.nil? && permissionable_thing.id == permission_role.permissionable_id
        end # do
      end # each do 
    end # if
    puts "After create Ability "*20
  end
end

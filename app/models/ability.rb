class Ability < ActiveRecord::Base
  include CanCan::Ability
   def initialize(user)
    # Define abilities for the passed in user here.
    user ||= User.new # guest user (not logged in)
   
    if user.role_id? :l #admin
     # an admin can do everything
      can :manage, :all 
    end
    end
end
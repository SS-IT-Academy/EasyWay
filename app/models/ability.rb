class Ability < ActiveRecord::Base
  include CanCan::Ability
   # def initialize(user)
    # Define abilities for the passed in user here.
   # user ||= User.new # guest user (not logged in)
   
   # if user.role_id? :1 #admin
     # an admin can do everything
   #   can :manage, :all
  #  elsif user.role_id? :2 #manager
      # an editor can do everything to sheludess and reports
   #   can :manage, [,]  
     
 # end
end
class Menu < ActiveRecord::Base
  # :TODO add feedback to itself  add keys
  attr_accessible :parent_id, :role_id, :user_id, :bookmark_id, :position
  belongs_to :bookmark
  belongs_to :user
  belongs_to :role
  has_ancestry 
  
  scope :with_role, lambda {|roles_id| where("roles_id = ?", roles_id)}
end

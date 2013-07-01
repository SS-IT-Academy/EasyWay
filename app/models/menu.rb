class Menu < ActiveRecord::Base
  # :TODO add feedback to itself  add keys
  attr_accessible :parent_id, :role_id, :target, :text, :title, :url, :user_id
  
  belongs_to :user
  belongs_to :role
  has_ancestry 
  validates :target, :text, :title, :url, :presence => true
  
end

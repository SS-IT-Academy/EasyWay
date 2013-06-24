class Menu < ActiveRecord::Base
# :TODO add feedback to itself  add keys
  attr_accessible :parent_id, :role_id, :target, :text, :title, :url, :user_id
   
   
   belongs_to :user,
    :foreign_key => "user_id"
   #belongs_to :role, :through => :user,
   # :foreign_key => "role_id"
    
    validates :target, :text, :title, :url, :presence => true
end

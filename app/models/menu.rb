class Menu < ActiveRecord::Base
  attr_accessible :parent_id, :role_id, :target, :text, :title, :url, :user_id
end

class Bookmark < ActiveRecord::Base
  attr_accessible :title, :url, :description
  has_many :menus
 
end

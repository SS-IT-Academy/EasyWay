class TableTemplate < ActiveRecord::Base
  attr_accessible :cell_body, :name
  
  has_many :table_filters
  has_many :resources, :through => :table_filters
  
  has_many :table_headers
  has_many :resource_types, :through => :table_headers
  
  has_one :table_cell_item
  has_many :resource_types, :through => :table_cell_item
  
  validates :cell_body, :presence => true
  validates :name, :presence => true
end
  
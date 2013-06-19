class TableTemplate < ActiveRecord::Base
  attr_accessible :cell_body, :name
  
  has_many :table_filter
  has_many :resource, :through => :table_filter
  
  has_many :table_header
  has_many :resource_type, :through => :table_header
  
  has_one :table_cell_item
  has_many :resource_type, :through => :table_cell_item
  
  validates :cell_body, :presence => true
  validates :name, :presence => true
end

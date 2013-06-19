class TableCellItem < ActiveRecord::Base
  attr_accessible :resource_type_id, :table_template_id
  
  belongs_to :resource_type
  belongs_to :table_template
  
  validates :resource_type_id, :presence => true
  validates :table_template_id, :presence => true
end

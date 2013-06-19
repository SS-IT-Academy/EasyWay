class TableFilter < ActiveRecord::Base
  attr_accessible :delimiter, :position_float, :position_num, :resource_id, :table_template_id
  
  belongs_to :table_template
  belongs_to :resources
  
  validates :delimiter, :presence => false
  validates :position_float, :presence => false
  validates :position_num, :presence => true
  validates :resource_id, :presence => true
  validates :table_template_id, :presence => true
  
end

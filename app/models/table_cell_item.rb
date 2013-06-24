class TableCellItem < ActiveRecord::Base
  attr_accessible :resource_type_id, :table_template_id
  
  belongs_to :resource_type
    #:foreign_key => "resource_type_id"
  belongs_to :table_template
    #:foreign_key => "table_template_id"
  validates :resource_type_id, :presence => true
  validates :table_template_id, :presence => true
end


class TableFilter < ActiveRecord::Base
  attr_accessible :delimiter, :position_float, :position_num, :resource_id, :table_template_id
  
  POSITION_FLOATS = ["next", "left", "right"]
  DELIMITERS = [", ", "; "," ", "<br />"]
  belongs_to :table_template
    #:foreign_key => "table_template_id"
  belongs_to :resource
    #:foreign_key => "resource_id"
  validates :delimiter, :presence => false
  validates :position_float, :presence => false
  validates :position_num, :presence => true,  :numericality => true
  validates :resource_id, :presence => true
  validates :table_template_id, :presence => true
end


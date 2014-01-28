class TableHeader < ActiveRecord::Base
  attr_accessible :orientation, :parent_id, :position_num, :resource_type_id, :table_template_id
  
  #HORIZONTAL_IND = 0
  #VERTICAL_IND = 1
  
  ORIENTATIONS = ["horizontal","vertical"]
  belongs_to :table_template,
    :foreign_key => "table_template_id"
  belongs_to :resource_type,
    :foreign_key => "resource_type_id"
  
  validates :position_num, :resource_type_id, :table_template_id, :orientation, :presence => true
  
  scope :horizontal_headers, lambda{|template_id| joins(:resource_type).where("table_template_id=?", template_id).where("orientation = ?", ORIENTATIONS[0]).order(:position_num)}
  scope :vertical_headers, lambda{|template_id| joins(:resource_type).where("table_template_id=?", template_id).where("orientation = ?", ORIENTATIONS[1]).order(:position_num)}
end

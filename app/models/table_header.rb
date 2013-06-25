class TableHeader < ActiveRecord::Base
  attr_accessible :orientation, :parent_id, :position_num, :resource_type_id, :table_template_id
  
  belongs_to :table_template
    #:foreign_key => "table_template_id"
  belongs_to :resource_type
    #:foreign_key => "resource_type_id"
  
  validates :orientation, :presence => false
  validates :parent_id, :presence => true
  validates :position_num, :presence => true, :numericality => true
  validates :resource_type_id, :presence => true
  validates :table_template_id, :presence => true
end


class Field < ActiveRecord::Base
  attr_accessible :field_type_id, :name, :resource_type_id, :resource_type_reference_id
  
  has_one :field_type, :foreign_key => "field_type_id"
  has_many :resource_values, :dependent => :destroy
  belongs_to :resource_type, :foreign_key => "resource_type_id"
  
  validates :name, :resource_type_id, :field_type_id, :presence => true
end

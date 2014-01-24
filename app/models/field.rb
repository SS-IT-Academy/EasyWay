class Field < ActiveRecord::Base
  attr_accessible :field_type_id, :name, :resource_type_id, :resource_type_reference_id
  
  has_many :resource_values, :dependent => :destroy
  belongs_to :field_type  
  belongs_to :resource_type
  
  validates :name, :resource_type_id, :field_type_id, :presence => true
end

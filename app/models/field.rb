class Field < ActiveRecord::Base
  attr_accessible :field_type_id, :name, :resource_type_id
  has_one :FieldType,
    :foreign_key => "field_type_id"
  has_many :ResourceValues
  belongs_to :RecourceType,
    :foreign_key => "resource_type_id"
  validates :name, :resource_type_id, :field_type_id, :presence => true
end

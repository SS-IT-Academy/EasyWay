class Field < ActiveRecord::Base
  # :TODO delete descriptions
  attr_accessible :field_type_id, :name, :resource_type_id
  belongs_to :FieldType,
    :foreign_key => "field_type_id"
  has_many :ResourceValues
  belongs_to :RecourceType,
    :foreign_key => "resource_type_id"
end

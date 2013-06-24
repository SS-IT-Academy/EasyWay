class FieldType < ActiveRecord::Base
  # :TODO delete descriptions
  attr_accessible :name
  has_many :Fields
end

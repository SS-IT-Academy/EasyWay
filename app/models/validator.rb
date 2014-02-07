class Validator < ActiveRecord::Base
  attr_accessible :body, :field_type_id, :name, :message

  belongs_to :field_type
  has_many :field_validations
  has_many :fields, through: :field_validations
end

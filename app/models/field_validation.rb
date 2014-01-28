class FieldValidation < ActiveRecord::Base
  attr_accessible :field_id, :validator_id
  
  belongs_to :field
  belongs_to :validator
end

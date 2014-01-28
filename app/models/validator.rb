class Validator < ActiveRecord::Base
  attr_accessible :body, :field_type_id, :name
  
  belongs_to :field_type
end

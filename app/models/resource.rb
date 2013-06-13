class Resource < ActionRecord :: Base
  attr_accessible :description, :resource_type_id
  has_one :ResourceType
  has_many :ResourceValue
end
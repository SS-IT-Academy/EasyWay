class Resource < ActionRecord :: Base
  has_one :ResourceType
  has_many :ResourceValue
  @description
end
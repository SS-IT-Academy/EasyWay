class ResourceValue < ActionRecord :: Base
  has_one :Resource
  has_one :Field
  @fieldValue
end
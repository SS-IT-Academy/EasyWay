class Field < ActionRecord :: Base
  has_one :FieldType
  has_many :ResourceValue
  @fieldTitle
end
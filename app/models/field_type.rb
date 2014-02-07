class FieldType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :fields
  has_many :validators
  before_destroy :check_for_fields
  
  validates :name, :presence => true
  
  def check_for_fields
    if fields.count > 0
      errors.add_to_base("cannot delete field type while fields exist")
      return false
    end
  end
  
end

class FieldType < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :fields
  before_destroy :check_for_fields
  
  validates :name, :presence => true
  
  def check_for_fields
    if fields.count > 0
      errors.add_to_base("cannot delete field type while fields exist")
      return false
    end
  end
  
end

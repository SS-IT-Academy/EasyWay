class FieldType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :Fields
  before_destroy :check_for_Fields
  validates :name, :presence => true
  def check_for_Fields
    if fields.count > 0
      errors.add_to_base("cannot delete resource type while resources exist")
      return false
    end
  end
end

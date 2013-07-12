class Resource < ActiveRecord::Base
  attr_accessible :description, :resource_type_id
  belongs_to :ResourceType,
    :foreign_key => "resource_type_id"
  has_many :ResourceValues, :dependent => :destroy
  accepts_nested_attributes_for :ResourceValues, :allow_destroy => true
  validates :resource_type_id, :presence => true
end

class Resource < ActiveRecord::Base
  # :TODO :dependent => :destroy
  attr_accessible :description, :resource_type_id
  belongs_to :ResourceType,
    :foreign_key => "resource_type_id"
  has_many :ResourceValues
  validates :resource_type_id, :presence => true
end
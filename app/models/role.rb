class Role < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :users
  has_many :permission_resources
end

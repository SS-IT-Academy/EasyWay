class Role < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :users
  has_and_belongs_to_many :permissions
end

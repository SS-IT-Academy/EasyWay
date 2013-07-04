class Permission < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :roles
  validates_uniqueness_of :name
  belongs_to :resources, :polymorphic => true
end

class Role < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name, :message => "Please choose another name"
  validates_presence_of :name, :message => "Field name can`t be blank"
  has_many :users
  has_many :permission_resources
  has_many :Menus
  
  def admin?
    name == 'admin'
  end

  has_many :Menus

end

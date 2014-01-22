class Role < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name, :message => "така роль вже існує"
  validates_presence_of :name, :message => "поле не може бути пустим"
  has_many :users
  has_many :permission_resources
  has_many :Menus
  
  def admin?
    name == 'admin'
  end

  has_many :Menus

end

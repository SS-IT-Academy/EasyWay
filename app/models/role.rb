class Role < ActiveRecord::Base
  ADMIN   = "Admin"
  MANAGER = "Manager"
  TEACHER = "Teacher"
  TRAINEE = "Trainee"
  GUEST   = "Guest"

  attr_accessible :name
  validates_uniqueness_of :name, :message => "Please choose another name"
  validates_presence_of :name, :message => "Field name can`t be blank"
  has_many :users, foreign_key: "roleid"
  has_many :Menus
  has_many :permission_roles, foreign_key: :roles_id
  
  def admin?
    name == 'admin'
  end

  def beginer?
    name == 'beginer'
  end

  has_many :Menus

end

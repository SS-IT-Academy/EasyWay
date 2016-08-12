class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  before_save :default_values
  
  belongs_to :role, foreign_key: "roleid"
  has_many :Menus

#   attr_accessible :email, :username, :password, :password_confirmation, :new_password, :new_password_confirmation, :remember_me
#   attr_accessor :password, :new_password, :remember_me
#   before_save :encrypt_password
  
#   validates_confirmation_of :password
#   validates_presence_of :password, :on => :create
#   validates_presence_of :email
   validates_presence_of :username, :on => :create
#   validates_uniqueness_of :email
   validates_uniqueness_of :username
  def default_values
    self.roleid ||= 1
  end

#   def encrypt_password
#     if password.present?
#       self.password_salt = BCrypt::Engine.generate_salt
#       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
#     end
#   end

#   def self.authenticate_by_email(email, password)
#     user = find_by_email(email)
#     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
#     user
#     else
#       nil
#     end
#   end

#   def self.authenticate_by_username(username, password)
#     user = find_by_username(username)
#     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
#       user
#     else
#     nil
#   end

  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

#   def encrypt_password
#     if password.present?
#       self.password_salt = BCrypt::Engine.generate_salt
#       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
#     end
#   end
# end
  
#   def name
#     guest ? "Guest" : username
#   end
  
end

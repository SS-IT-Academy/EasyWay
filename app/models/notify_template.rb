class NotifyTemplate < ActiveRecord::Base
  
  # TODO: rename attribute name template_name => name  
  attr_accessible :body, :desc, :template_name
  validates :template_name, :presence => true
  validates :body, :presence => true
  validates :desc, :presence => true
  has_many :notifyevents
end


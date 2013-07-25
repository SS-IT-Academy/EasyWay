class NotifyTemplate < ActiveRecord::Base
  # TODO: rename attribute name template_name => name  
  attr_accessible :body, :desc, :notify_template_name
  validates :notify_template_name, :presence => true
  validates :body, :presence => true
  validates :desc, :presence => true
  has_many :notify_events
  has_many :mappings
  
end


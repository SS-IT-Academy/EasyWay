class NotifyTemplate < ActiveRecord::Base
  attr_accessible :body, :desc, :notify_template_name
  
  has_many :notify_events
  has_many :mappings
  
  validates :notify_template_name, :presence => true
  validates :body, :presence => true
  validates :desc, :presence => true
  
end


class NotifyTemplate < ActiveRecord::Base
  has_many :notifyevents
  attr_accessible :body, :desc, :template_name
end

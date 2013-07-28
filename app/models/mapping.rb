class Mapping < ActiveRecord::Base
  # TODO: rename attribute :property_id to :notify_observer_property_id
  attr_accessible :notify_observer_property_id, :notify_template_id, :template_parameter
  belongs_to :notify_observer_property , :foreign_key => :notify_observer_property_id
  belongs_to :notify_template
end

class Resource < ActiveRecord::Base
  attr_accessible :description, :resource_type_id, :resource_values_attributes
  
  belongs_to :resource_type
  has_many :resource_values, :dependent => :destroy,  :inverse_of => :resource
  has_many :event_resources
  has_many :events, :through => :event_resources
  has_many :permission_roles, as: :permissionable

  act_as_permissionable_child ResourceType
  
  validates :resource_type_id, :presence => true
  validates_associated_bubbling :resource_values
  accepts_nested_attributes_for :resource_values
  
  scope :by_resource_type, lambda { |resource_type_id| where("resource_type_id = ?", resource_type_id) }

  def all_value_ids(value_ids=[])
    value_ids.pop if value_ids.any?
    self.resource_values.each do |value|
      value_ids << value.id
      if value.resource_reference_id
        Resource.find(value.resource_reference_id).all_value_ids(value_ids)
      end
    end
    value_ids 
  end

  def eval_description
    rt = ResourceType.find(self.resource_type_id)
    field_names = rt.all_field_names
    description = rt.description ? rt.description : ""
    field_ids   = rt.all_field_ids
    
    field_ids.each_index do |i|
      self.all_value_ids.each do |value|
        rv = ResourceValue.find(value)
        if field_ids[i] == rv.field_id
          description.gsub!("$${#{field_names[i]}}", rv.value)
        end
      end
    end
    puts description
    self.update_attribute :description, description
  end

  def self.resource_fields_with_values_by_resource(resource_id)
    find(resource_id).resource_type
      .fields_resource_values
      .select("resource_values.id")      
      .select("fields.name")
      .select("resource_values.resource_reference_id")
      .where("resource_id=?", resource_id)
  end

  def self.resources_by_event(event_id)
    select("resource_types.name")
        .select("resources.id")
        .select("resources.description")
        .joins(:resource_type, :event_resources)
        .where("event_id=?", event_id)
  end  
end

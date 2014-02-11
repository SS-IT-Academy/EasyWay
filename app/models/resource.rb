class Resource < ActiveRecord::Base
  attr_accessible :description, :resource_type_id
  
  belongs_to :resource_type
  has_many :resource_values, :dependent => :destroy
  has_many :event_resources
  has_many :permission_roles, as: :permissionable

  act_as_permissionable_child ResourceType
  
  validates :resource_type_id, :presence => true
  
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
end

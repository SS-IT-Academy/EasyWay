class ResourceType < ActiveRecord::Base  
  attr_accessible :name, :description
  
  has_many :fields, :dependent => :destroy
  has_many :resources, :dependent => :restrict 
  has_many :resource_values, :through => :resources 
  has_many :fields_resource_values, 
  			:through => :fields, 
  			:source => :resource_values,
  			:class_name => ResourceValue
  has_many :permission_roles, as: :permissionable

  validates :name, presence: true, uniqueness: true
  validate :check_description

  def all_field_ids(field_ids=[])
    field_ids.pop if field_ids.any?
    self.fields.each do |field|
      field_ids << field.id
      if field.resource_type_reference_id
        ResourceType.find(field.resource_type_reference_id).all_field_ids(field_ids)
      end
    end
    field_ids 
  end

  def all_field_names(field_names=[])
    if field_names.empty?
      tail = ""
    else
      tail = field_names.last + '.'
      field_names.pop
    end
    # tail = field_names.empty? ? "" : field_names.last + '.'
    self.fields.each do |field|
      field_names << tail + field.name
      if field.resource_type_reference_id
        ResourceType.find(field.resource_type_reference_id).all_field_names(field_names)
      end
    end
    field_names
  end

  def check_description
    if self.fields.any?
      if description
        user_field_names = description.scan(/\$\$\{+[a-zA-Z0-9.]+}/).map { |name| name.delete("${}") }
      else
        update_attribute :description, ""
        return true
      end
      user_field_names.each do |name|
        unless self.all_field_names.include? name
          return errors[:base] << "Undefined name: #{name}"
        end
      end
    end
    true
  end
end

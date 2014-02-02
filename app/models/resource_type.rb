class ResourceType < ActiveRecord::Base
  # after_create :eval_description  
  attr_accessible :name, :description
  
  has_many :fields, :dependent => :destroy
  has_many :resources, :dependent => :restrict 
  has_many :resource_values, :through => :resources 
  has_many :permission_roles, as: :permissionable

  validates :name, presence: true, uniqueness: true

  #private

  # def field_names
  #   # s = self.description
  #   # s % { :name => self.name }
  #   # puts "\n#{s}********\n#{self.description}\n"
  #   # self.description = s 

  #   # self.description.gsub!("$${name}", self.name)
  #   # puts self.description
  #   # self.save!
  #   field_names, fields_ids, values = [], [], []
  #   # self.fields.each do |field|
  #   #   field_names << field.attributes.select do |key, value|
  #   #     key == "name"
  #   #   end["name"]
  #   # end
  #   self.fields.each do |field|
  #     field_names << field.name
  #     fcopy = field.dup
  #     while fcopy.field_type_id == 7
  #       puts "#{fcopy.name} is Complex"
  #       rt = ResourceType.find(fcopy.resource_type_reference_id)
  #       rt.fields.each do |f|
  #         field_names << '.' + f.name

  #       end
  #     end
  #     # fields_ids  << field.attributes["id"]
  #   end
  #   puts field_names
  #   field_names
  # end

  # def field_ids
  #   fields_ids = []
  #   self.fields.each do |field|
  #     fields_ids << field.id
  #   end
  #   fields_ids
  # end
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

end

=begin
rt.fields.each do |field|
  field.attributes.reject do |key, value|
    "id", "created_at"].include?(key)
  end["name"]
end
"id", "created_at","updated_at", "field_type_id", 
         "resource_type_id", "resource_type_reference_id"
=end
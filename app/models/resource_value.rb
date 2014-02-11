class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :value, :resource_reference_id
  
  belongs_to :resource
  belongs_to :field
  # has_one :resource_type, :through => :resource,
  #    :foreign_key => "resource_reference_id"
  delegate :resource_type, :to => :resource, :allow_nil => true
  validates :field_id, :resource_id, :presence => true
  validate :custom_validation

  def custom_validation
    validators = Field.find(field_id).validators
    validators.each do |v|
      puts v.body.gsub("@@", value)
      begin
        unless eval(v.body.gsub("@@", value))
          errors[:base] << v.message
        end
      rescue
        errors[:base] << "Validator '#{v.name}' with id #{v.id} has bad syntax"
      end
    end
    true
  end
end

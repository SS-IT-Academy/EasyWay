class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :value, :resource_reference_id
  
  belongs_to :resource
  belongs_to :field
  # has_one :resource_type, :through => :resource,
  #    :foreign_key => "resource_reference_id"
  delegate :resource_type, :to => :resource, :allow_nil => true
  validates :field_id, :resource, :presence => true
  validate :custom_validation

  def custom_validation
    field = Field.where(id:field_id)
    validators = field.try(:validators)
    validators.each do |v|
      evaluate_validator(v, value) if v.is_a?(Validator)
    end unless validators.blank?
    true
  end

  private 

  def evaluate_validator(validator, value)
    begin
      result = eval(validator.body.gsub("@@", value))
      unless [TrueClass, FalseClass].include?(result.class) 
        raise Exception.new("Validator result class should be boolean, but is #{result.class}") 
      end
      errors[:base] << validator.message unless result
    rescue => e
      errors[:base] << "Validator '#{validator.name}' with id #{validator.id} has bad syntax. Error: #{e.message}"
    end
  end  
end

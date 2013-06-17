class Field < ActiveRecord::Base
  attr_accessible :field_title, :field_type_id, :resource_type_id
end

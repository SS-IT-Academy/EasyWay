class TableHeader < ActiveRecord::Base
  attr_accessible :orientation, :parent_id, :position_num, :resource_type_id, :table_template_id
end

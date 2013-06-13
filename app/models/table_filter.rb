class TableFilter < ActiveRecord::Base
  attr_accessible :delimiter, :position_float, :position_num, :resource_id, :table_template_id
end

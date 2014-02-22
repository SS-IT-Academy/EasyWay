class TableTemplate < ActiveRecord::Base
  attr_accessible :cell_body, :name

  has_many :table_filters, dependent: :destroy
  has_many :resources, :through => :table_filters

  has_many :table_headers, dependent: :destroy
  has_many :resource_types, :through => :table_headers

  has_one :table_cell_item, dependent: :destroy
  has_many :resource_types, :through => :table_cell_item

  validates :name, :presence => true
  has_many :permission_roles, as: :permissionable

  def get_resource_types_for_cell_item
    resource_types = []
    h_header = TableHeader.horizontal_headers(id).order(:position_num).last
    v_header = TableHeader.vertical_headers(id).order(:position_num).last
    if h_header || v_header
      fields = []
      if h_header
        fields << h_header.resource_type.fields.complex.all
        fields << Field.where("resource_type_reference_id = ?", h_header.resource_type_id).all
      end
      if v_header
        fields << v_header.resource_type.fields.complex.all
        fields << Field.where("resource_type_reference_id = ?", v_header.resource_type_id).all
      end
      resource_types = fields.empty? ? [] : ResourceType.find(fields.flatten.collect{|f| f.resource_type_id})
    else
      resource_types = ResourceType.all
    end
    resource_types
  end
end

class EventPropertiesEntity < ActionContoller::Base
  attr_accessor :property
  def intialize(property)
    @property = property
  end
  
  def to_s
    return "Property = " + @property
  end

end
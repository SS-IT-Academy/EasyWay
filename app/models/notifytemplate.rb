class NotifyTemplate < ActiveRecord::Base
  
  attr_accessor :prop
  
  def initialize(prop)
    @prop = prop
  end
  
  
  
  def html_template
    var = "<html><body>Igor notification " + @prop.to_s + "</body></html>"
    return var
  end

  def text_template
    var = "Igor notification"
    return var
  end
end
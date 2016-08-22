module Selector
  class BaseSelector
    DATA = {}

    def self.get_selector_instance(clazz)
      "Selector::#{clazz.singularize.capitalize}Selector".constantize.new
    end

    def get(*path)
      fail 'Could not get data from BaseSelector' if self == Selector::BaseSelector
      fail "Selector #{self.class} not configured properly" if self.class::DATA.blank?
      root = self.class::DATA
      path.each do |key|
        key = key.is_a?(Symbol) ? key : key.gsub(/\s/, '').underscore.to_sym
        root = root[key]
      end
      root
    end
  end
end

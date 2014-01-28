class ActiveRecord::Base
	def self.act_as_permissionable_child(parent)
		self.class_variable_set(:@@parent, parent)
	end	
end	
class ActionController::Base
	def self.act_as_permissionable_controller(model)
		self.class_eval <<-CODE
			before_filter :only => [:show]..
			current_user.role
			render_partial => access_denaid
			request.env['HTTP_REFERER']
CODE
	end
end
module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user}) if request.env['warden']
      allow(controller).to receive(:current_user).and_return(nil) if controller
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user) if request.env['warden']
      allow(controller).to receive(:current_user).and_return(user) if controller
    end
  end
end
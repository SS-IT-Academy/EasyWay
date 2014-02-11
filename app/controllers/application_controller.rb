class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :guest_menu
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # def current_user
  #   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  #   @current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if cookies[:auth_token] && @current_user.nil?
  #   @current_user
  # end
  
  def guest_menu
    @Menu_items = Menu.order("ancestry desc")
  end
 


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    
    devise_parameter_sanitizer.for(:accept_invitation).concat [:username]
    devise_parameter_sanitizer.for(:invite).concat [:username]

   # devise_parameter_sanitizer.for(:sign_up) { |u| raise u.inspect; u.permit(:username, :email, :password, :password_confirmation) } 
  end

end
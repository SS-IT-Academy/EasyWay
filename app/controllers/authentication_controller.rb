class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def signed_out
  # clear the authentication toke when the user manually signs out
  user = User.find_by_id(session[:user_id])

  if user
    update_authentication_token(user, nil)
    user.save
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
  else
    redirect_to :sign_in
  end
end
  
  def account_settings
    @user = current_user
  end

  def login
    
    username_or_email = params[:user][:username]
    password = params[:user][:password]
    

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end
end

def update_authentication_token(user, remember_me)
  if remember_me == 1
    # create an authentication token if the user has clicked on remember me
    auth_token = SecureRandom.urlsafe_base64
    user.authentication_token = auth_token
    cookies.permanent[:auth_token] = auth_token
  else # nil or 0
    # if not, clear the token, as the user doesn't want to be remembered.
    user.authentication_token = nil
    cookies.permanent[:auth_token] = nil
  end
end

 def set_account_info
    #@user = User.find(params[:id])
 
  old_user = current_user

  # verify the current password by creating a new user record.
  @user = User.authenticate_by_email(old_user.email, params[:user][:password])

  # verify
  if @user.nil?
    @user = current_user
    @user.errors[:password] = "Password is incorrect."
    render :action => "account_settings"
  else
    # update the user with any new username and email
    @user.update(params[:user])
    # Set the old email and username, which is validated only if it has changed.
    @user.previous_email = old_user.email
    @user.previous_username = old_user.username

    if @user.valid?
      # If there is a new_password value, then we need to update the password.
      @user.password = @user.new_password unless @user.new_password.nil? || @user.new_password.empty?
      @user.save
      flash[:notice] = 'Account settings have been changed.'
      redirect_to :root
    else
      render :action => "account_settings"
    end
  end
end

end
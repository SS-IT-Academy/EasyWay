class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
  old_user = current_user

  # verify the current password by creating a new user record.
  @user = User.authenticate_by_email(old_user.username, params[:user][:password])

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

  # POST /users
  # POST /users.json
#  def create
 #   @user = User.new(params[:user])
#
 #   respond_to do |format|
  #    if @user.save
   #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #    format.json { render json: @user, status: :created, location: @user }
     # else
      #  format.html { render action: "new" }
       # format.json { render json: @user.errors, status: :unprocessable_entity }
     # end
   # end
 # end
 def create
      @user = User.new(params[:user])

    if verify_recaptcha
      if @user.valid?
        @user.save
        #UserMailer.welcome_email(@user).deliver
        session[:user_id] = @user.id
        flash[:notice] = 'Welcome.'
        redirect_to :root
      else
        render :action => "new_user"
      end
    else
      flash.delete(:recaptcha_error) # get rid of the recaptcha error being flashed by the gem.
      flash.now[:error] = 'reCAPTCHA is incorrect. Please try again.'
      render :action => "new_user"
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

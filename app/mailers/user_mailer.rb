class UserMailer < ActionMailer::Base
  default :from => "easyway087@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = 'http://easyway.com/sign_in'
    attachments.inline['logo1.png'] = File.read('app/assets/images/logo1.png')
    mail :subject => "Welcome to Easyway!", :to => @user.email
  end
end

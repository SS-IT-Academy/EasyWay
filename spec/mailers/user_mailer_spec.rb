require 'spec_helper'

  describe UserMailer do
      describe 'welcome_email' do
      let(:user) { stub(:email => 'svisigor@mail.ru') }
      let(:mail) {UserMailer.welcome_email(user)}
      
      it 'renders the subject' do
      mail.subject.should_be 'Welcome to Easyway!'
      end
  end
end
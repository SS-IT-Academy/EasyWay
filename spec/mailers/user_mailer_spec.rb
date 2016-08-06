require 'spec_helper'

describe UserMailer do
  describe 'welcome_email' do
    let(:user) do 
      res = double('user')
      allow(res).to receive(:email).and_return('svisigor@mail.ru')
      allow(res).to receive(:username).and_return('Svist Igor')
      res 
    end  
    let(:mail) {UserMailer.welcome_email(user)}
    
    it 'renders the subject' do
      mail.subject.should == 'Welcome to Easyway!'
    end
  end
end
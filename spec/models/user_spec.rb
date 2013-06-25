require 'spec_helper'

describe User do
#  pending "add some examples to (or delete) #{__FILE__}"
#let(:user) { FactoryGirl.create(:user)
    #@user = FactoryGirl.create(:user) 

 subject { FactoryGirl.create(:user) }
    #subject(:user)
    it { should respond_to(:username) }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
  

    it { should be_valid(:username)}
    it { should be_valid(:email)}

end
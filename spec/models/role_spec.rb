require 'spec_helper'

describe Role do
#  pending "add some examples to (or delete) #{__FILE__}"
#let(:user) { FactoryGirl.create(:user)
    #@user = FactoryGirl.create(:user) 

 subject { FactoryGirl.create(:role) }
    #subject(:user)
    it { should respond_to(:name) }
    it { should be_valid(:name)}
end
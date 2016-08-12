require 'spec_helper'

describe User do
  it "is valid with name, email and password confirmation" do
    u = create(:user)
    expect(u).to be_valid
  end
  
  it "is invalid without email" do
    u = build(:user, :email => nil)
    u.save
    expect(u).to have(1).errors_on(:email)
  end

  it "is invalid without name" do
    u = build(:user, :username => nil)
    u.save
    expect(u).to have(1).errors_on(:username)
  end

  it "is invalid if passwords don't match" do
    u = build(:user, :password => "pwd123456", :password_confirmation => "wpd123456")
    u.save
    expect(u).to have(1).errors_on(:password)
  end

  it "is invalid if passwords has less 8 charackters" do
    u = build(:user, :password => "pwd1", :password_confirmation => "pwd1")
    u.save
    expect(u).to have(1).errors_on(:password)
  end

  context "checks association" do
    it { should belong_to(:role) }
    it { should have_many(:Menus) }
  end  
end

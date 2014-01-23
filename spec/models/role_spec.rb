require 'spec_helper'

describe Role do

  context "checks attr_accessible" do

    it { should allow_mass_assignment_of(:name) }

  end

  context "validates_uniqueness_of" do

    it do
      should validate_uniqueness_of(:name).with_message('Please choose another name')
    end

  end
  
  context "validates_presence_of" do

    it { should validate_presence_of(:name).with_message('Field name can`t be blank') }
  
  end

  context "checks association" do

    it { should have_many(:users) }
    it { should have_many(:permission_resources) }
    it { should have_many(:Menus) }

  end

end
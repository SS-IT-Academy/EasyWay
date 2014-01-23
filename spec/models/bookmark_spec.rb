require 'spec_helper'

describe Bookmark do
  
  context "checks attr_accessible" do

    it { should allow_mass_assignment_of(:title) }
	it { should allow_mass_assignment_of(:url) }
	it { should allow_mass_assignment_of(:description) }
	
  end

  context "checks association" do

    it { should have_many(:menus) }

  end

  context "checking validations" do
  
    it { should validate_presence_of(:title) }

  end

end

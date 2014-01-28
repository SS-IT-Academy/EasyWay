require 'spec_helper'

describe EventType do

	context "shoulda gem" do

		context "checks association" do

			it { should have_many(:events) }

		end

		context "checking validations" do

			it { should validate_presence_of(:name) }

		end

		context "checks attr_accessible" do

			it { should allow_mass_assignment_of(:name) }

		end

	end

end

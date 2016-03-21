require 'spec_helper'

describe EventResource do

	context "shoulda gem" do

		context "checks association" do

		#	it { should have_many(:table_cell_items) }
			it { should belong_to(:event) }
			it { should belong_to(:resource) }

		end

		context "checking validations" do

			it { should validate_presence_of(:event_id) }
			it { should validate_presence_of(:resource_id) }

		end

		context "checks attr_accessible" do

			it { should allow_mass_assignment_of(:event_id) }
			it { should allow_mass_assignment_of(:resource_id) }

		end

	end

end

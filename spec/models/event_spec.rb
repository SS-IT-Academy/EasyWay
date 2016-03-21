require 'spec_helper'

describe Event do

	context "shoulda gem" do

		context "checks association" do

			it { should have_many(:event_resources).dependent(:destroy) }
			it { should have_many(:resources).through(:event_resources) }
			it { should belong_to(:event_type) }
			it { should belong_to(:recurrence) }
			it { should have_many(:children).dependent(:destroy) }
			it { should belong_to(:parent) }

		end

		context "checking validations" do

			it { should validate_presence_of(:name) }
			it { should validate_presence_of(:start_at) }
			it { should validate_presence_of(:end_at) }
			it { should validate_presence_of(:event_type_id) }

		end

		context "checks attr_accessible" do
			
			it { should allow_mass_assignment_of(:recurrence_attributes) }
			it { should allow_mass_assignment_of(:name) }
			it { should allow_mass_assignment_of(:end_at) }
			it { should allow_mass_assignment_of(:start_at) }
			it { should allow_mass_assignment_of(:event_type_id) }
			it { should allow_mass_assignment_of(:recurrence_id) }

		end

	end

end

# require 'simplecov'
# SimpleCov.start
require 'spec_helper'

describe Recurrence do

  context "shoudla gem" do

    context "checks association" do      
      it { should have_many(:events) }
    end

    context "checks attr_accessible" do
      it { should allow_mass_assignment_of(:repetition) }
    end

  end

	# context "Checking validations" do

	# 	it 'should have valid factory' do
	# 		build(:recurrence).should be_valid
	# 	end

	# 	it 'is invalid without some attribute' do 
	# 		build(:invalid_recurrence).should_not be_valid
	# 	end

	# end

	# context "accessible attributes" do
 #    it "should not allow access to ..." do
 #      expect{
 #        Recurrence.new(la_la_la: true)
 #        Recurrence.new(tu_tu_tu: true)
 #      }.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
 #    end

 #    it "should allow access to attr_accessible" do
 #      expect{
 #        Recurrence.new(repetition: true)
 #        Recurrence.new(end_date: true)
 #        Recurrence.new(start_date: true)
 #      }.to_not raise_error(ActiveModel::MassAssignmentSecurity::Error)
 #    end
 #  end
end

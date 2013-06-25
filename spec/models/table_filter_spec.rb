require 'spec_helper'
describe TableFilter do
   subject { FactoryGirl.build(:table_filter) }

   table_filter.table_template.should be_valid
end
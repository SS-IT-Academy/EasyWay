require 'spec_helper'

describe Menu do
  subject {FactoryGirl.create(:menu)}
  it {should be_valid(:title)}
end
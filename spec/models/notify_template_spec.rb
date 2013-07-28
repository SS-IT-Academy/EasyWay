require 'spec_helper'

describe NotifyTemplate do
  it "is invalid without a template_name" do
    expect(NotifyTemplate.new(:template_name => nil)).to have(1).errors_on(:name)
    end
     
    it "is invalid without a body" do
    expect(NotifyTemplate.new(:body => nil)).to have(1).errors_on(:body)
    end
  end
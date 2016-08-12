RSpec::Matchers.define :be_the_same_time_as do |expected|
  match do |actual|
    expect(expected.strftime("%d-%m-%Y %H:%M:%S")).to eq(actual.strftime("%d-%m-%Y %H:%M:%S"))
  end
end

# describe "time comparison" do
#   it "passes for equal dates" do
#     expect(Time.new(2014, 4, 2)).to be_the_same_time_as Time.new(2014, 4, 2)
#   end

#   it "passes for equal time" do
#     expect(Time.now).to be_the_same_time_as Time.now
#   end

#   it "doesn't pass for different time" do
#     expect(Time.now).to_not be_the_same_time_as Time.new(2014, 4, 2)
#   end
# end
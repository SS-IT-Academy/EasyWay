RSpec.shared_context "authorized", :authorized => true do
  before(:each) do
    @ability = Object.new.extend(CanCan::Ability)
    allow(@controller).to receive(:current_ability).and_return(@ability)
  end
end
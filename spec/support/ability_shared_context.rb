RSpec.shared_context "stub_ability", ability_stubbed: true do
  before(:each) do
    stub_ability
  end

  def stub_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability).and_return(@ability) if controller
  end
end
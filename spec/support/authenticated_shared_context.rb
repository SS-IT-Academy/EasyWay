RSpec.shared_context "authenticated", :authenticated => true do
  before(:each) do
    sign_in User.first || create(:user)
  end
end
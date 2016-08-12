RSpec.shared_context "authenticated", :authenticated => true do
  before(:each) do
    user = User.first || create(:invited_user)
    sign_in user
  end
end
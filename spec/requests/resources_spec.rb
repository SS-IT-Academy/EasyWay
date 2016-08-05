require 'spec_helper'

describe "Resources", type: :controller, authenticated: true do
  render_views
  
  before(:each) do
    @controller = ResourcesController.new
  end

  describe "GET /resources", authorized: true do
    it "render template when Resources are allowed" do
      @ability.can :manage, Resource
      get :index
      response.status.should be(200)
    end

    it "redirect not authorized when can't manage Resources" do
      @ability.cannot :manage, Resource
      get :index
      response.status.should be(302)
    end
  end
end

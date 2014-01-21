# require 'simplecov'
# SimpleCov.start
require 'spec_helper'

describe EventsController do

  context 'GET index' do

    it "assigns events" do
      event1 = create(:event)
      event2 = create(:event)
      get :index
      expect(assigns(:events)).to eq([event1,event2])
    end

    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end

  end 

  context 'GET show' do

    it 'assigns event' do
      event = create(:event)
      get :show, id: event
      expect(assigns(:event)).to eq(event)
    end

    it 'render show page' do
      get :show, id: create(:event)
      expect(response).to render_template(:show)
    end

  end

  context "GET new" do

    it "event should not be a new Event" do
      get :new
      expect(assigns(:events)).to_not be_a_new(Event)
    end

    it 'event should be a new Event' do
      event_type1 = create(:event_type)
      event_type2 = create(:event_type)
      recurrence1 = create(:recurrence)
      recurrence2 = create(:recurrence)
      get :new, id: create(:event)
      expect(assigns(:event)).to be_a_new(Event)
      expect(assigns(:event_types)).to eq([event_type1,event_type2])
      expect(assigns(:recurrences)).to eq([recurrence1,recurrence2])
    end

    it 'expected response from new page' do
      get :new, id: create(:event)
      expect(response).to render_template('new')
    end

    it "unexpected response from new page" do
      get :new
      expect(response).to_not render_template(:news)
    end

  end

  context "GET edit" do

    it 'assigns event' do
      event_type1 = create(:event_type)
      event_type2 = create(:event_type)
      recurrence1 = create(:recurrence)
      recurrence2 = create(:recurrence)
      event = create(:event)
      get :edit, id: event
      expect(assigns(:event)).to eq(event)
      expect(assigns(:event_types)).to eq([event_type1,event_type2])
      expect(assigns(:recurrences)).to eq([recurrence1,recurrence2])
    end

    it 'render edit page' do
      get :edit, id: create(:event)
      expect(response).to render_template('edit')
    end

  end

  context "POST create" do
    
    it 'created new Event' do
      expect{
        post :create, event: attributes_for(:event)
      }.to change(Event, :count).by(1)
    end

    it "redirects to the new event" do
      post :create, event: attributes_for(:event)
      response.should redirect_to Event.last
    end

    it 'does not create new event' do
      expect{
        post :create, event: attributes_for(:invalid_event)
        }.to_not change(Event,:count)
    end

    it 'render events_new_path' do
      post :create, event: attributes_for(:invalid_event)
      response.should render_template :new
    end

    # let(:valid_attributes) do 
    #   { 
    #     :name => "Event", 
    #     :start_at => Time.now - 1.day, 
    #     :end_at => Time.now + 1.day, 
    #     :recurrence_id => 1,
    #     :event_type_id => 1 
    #   }

    #   it "assigns the requested event as event" do
      
    #   event = create(:event)
    #   resource_type = create(:resource_type)
    #   resource1 = create(:resource)
    #   resource2 = create(:resource)
    #   res_list = Resource.all
    #   #puts "res.all: #{Resource.all}"
    #   event_resource_attr = {event_id: event.id, resource_id: res_list.first.id}
    #   event_resource = EventResource.create(event_resource_attr)
    #   resources_params = {resources: [{id: event_resource.id, value: res_list.first.id}, {value: res_list[1].id}]}
    #   end_at = Time.now + 2.day
    #   EventResource.count.should eq(1)
    #   put :update, {id: event.id, event: valid_attributes.merge(end_at: end_at)}.merge(resources_params)
    #   event.end_at = end_at
    #   assigns(:event).should eq(event)  
    #   EventResource.count.should eq(2)      

    # end


  end

  describe "PUT update" do

    let(:valid_attributes) do 
      { 
        :name => "Event", 
        :start_at => Time.now - 1.day, 
        :end_at => Time.now + 1.day, 
        :recurrence_id => 1,
        :event_type_id => 1 
      }
    end

    it "assigns the requested event as @event" do
      
      event = create(:event)
      resource_type = create(:resource_type)
      resource1 = create(:resource)
      resource2 = create(:resource)
      res_list = Resource.all
      event_resource_attr = {event_id: event.id, resource_id: res_list.first.id}
      event_resource = EventResource.create(event_resource_attr)
      resources_params = {resources: [{id: event_resource.id, value: res_list.first.id}, {value: res_list[1].id}]}
      end_at = Time.now + 2.day
      EventResource.count.should eq(1)
      put :update, {id: event.id, event: valid_attributes.merge(end_at: end_at)}.merge(resources_params)
      event.end_at = end_at
      assigns(:event).should eq(event)  
      EventResource.count.should eq(2)      

    end

  end

  context "DELETE destroy" do

      it "deletes event" do 
        event = create(:event)
        expect{
          delete :destroy, id: event
        }.to change(Event,:count).by(-1)
      end

      it "redirects to events_url" do
        delete :destroy, id: create(:event)
        response.should redirect_to events_url
      end

    end


end

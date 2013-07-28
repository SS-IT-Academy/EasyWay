EasyW::Application.routes.draw do

  resources :recurrences


  resources :events


  resources :event_resources


  resources :event_types
  resources :menus
  resources :bookmarks


  resources :permission_resources


  resources :notify_event1s

  resources :menus

  


  resources :permissions

  resources :notify_schedulers
  root :to=>"home#index"
  resources :users

  resources :recipients

  resources :notify_observer_properties

  resources :notify_observers

  resources :events
  resources :notify_events

  resources :notify_templates

  resources :roles

  resources :permission_roles
  
  resources :resources, :has_many => :permission_roles
  resources :resource_types, :has_many => :permission_roles
  resources :resource_values
  resources :fields
  resources :field_types
  match "/new_popup" => "Menus#new_popup"
  match "/update_fields" => "ResourceTypes#update_fields"
  match "/update_resources" => "Resources#update_resources"
  
  match "/update_permroles_fields" => "PermissionRoles#update_permroles_fields"

  match "/get_field_types" => "FieldTypes#get_all_types"
  match "/get_resource_types" => "ResourceTypes#all_types"
  match "/remove_resource_fields" => "ResourceValues#remove_values"
  match "/get_resources" => "Resources#some_records"
  match "/get_recipients" => "Users#get_recipients"
  match "/add_event_resources" => "Resources#add_event_resources"
  match "/remove_event_resource" => "EventResources#remove_event_resource"
  match "/event_based_on" => "Events#event_based_on"
  match "/delete_menu_item" => "Menus#delete_menu_item"
  match "/resource_info" => "Resources#resource_info"
  match "/get_notify_template_mappings" => "NotifyObserverProperties#get_notify_template_mappings"
    

  get "signed_out" => "authentication#signed_out"
  get "forgot_password" => "authentication#forgot_password"
  get "password_sent" => "authentication#password_sent"

  get "sign_in" => "authentication#sign_in"
  post "sign_in" => "authentication#login"

  get "account_settings" => "authentication#account_settings"
  put "account_settings" => "authentication#set_account_info"

  get "forgot_password" => "authentication#forgot_password"
  put "forgot_password" => "authentication#send_password_reset_instructions"

  get "password_reset" => "authentication#password_reset"
  put "password_reset" => "authentication#new_password"

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

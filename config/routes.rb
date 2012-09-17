Wasabi::Application.routes.draw do

  resources :dashboard, controller: 'dashboard' do
    collection do
      post :search
    end
  end
  
  resources :customers
  resources :contacts
  match 'contacts/new/:id' => 'contacts#new'

  resources :activities do
    member do
      get :get_drop_down_options_of_campaigns
    end
    collection do
      get :planned
    end
  end
  match 'activities/new/:id' => 'activities#new'

  resources :tasks do
    member do
      get :get_drop_down_options_of_campaigns
      get :get_drop_down_options_of_activities
    end
    collection do
      get :finished
      get :my
    end
  end
  match 'tasks/new/:id' => 'tasks#new'

  resources :comments do
    member do
      post :create_with_id
    end
  end

  resources :campaigns do
    member do
      get :selective_index
      post :pending
      post :proseed
    end
    collection do
      get :actives
      get :pendings
      get :closed
      get :no_act_for_three_months
    end
  end
  match 'campaigns/new/:id' => 'campaigns#new'


  resources :categories

  resources :accuracies
  resources :priorities
  resources :action_kinds
  resources :phases
  resources :kinds
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'

end

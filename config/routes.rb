Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: 'admins/sessions' }
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }
  concern :active_scaffold_association, ActiveScaffold::Routing::Association.new
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  resources :profiles, concerns: :active_scaffold
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dashboard do
  	member do
  		get :request_cab
  	end
  end

  devise_scope :user do
    root to: "users/sessions#new"
  end

  resources :drivers

end

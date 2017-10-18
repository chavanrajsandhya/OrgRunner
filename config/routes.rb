Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: 'admins/sessions' }
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }

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

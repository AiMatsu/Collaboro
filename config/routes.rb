Rails.application.routes.draw do

  get '/' => 'root#top', as: 'root'

	devise_for :c_users, controllers: {
		sessions:      'c_users/sessions',
		passwords:     'c_users/passwords',
		registrations: 'c_users/registrations'
	}
	devise_for :f_users, controllers: {
		sessions:      'f_users/sessions',
		passwords:     'f_users/passwords',
		registrations: 'f_users/registrations'
	}
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :f_users, except: [:new, :create] do
  	 	resource :favorite_stars, only: [:create, :destroy]
      # resources :chatrooms, only: [ :show, :index]
  	end

  	resources :c_users, except: [:new, :create] do
  		resource :favorite_hearts, only: [:create, :destroy]
      # resources :chatrooms, only: [ :show, :index]
  	end

    resources :chatrooms, only: [ :show, :index] do
      resources :messages, only: [:create]
    end

  	resources :proposals
  	resources :requests
  	resources :crops_calendars
  	resources :blogs
end
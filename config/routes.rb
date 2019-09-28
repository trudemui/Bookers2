Rails.application.routes.draw do
	  	root to: 'home#index'
	  	get 'home/about' => 'home#about'

	  	devise_for :users
	  	
	  	resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
	  	resources :users, only: [:index, :show, :edit, :update]
end

Rails.application.routes.draw do
	root to: 'flights#index'
	resources :bookings, only: [:show, :new, :create]

end
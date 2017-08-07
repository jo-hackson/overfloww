Rails.application.routes.draw do

	# for the users controller, and for the registrations route
	devise_for :users, :controllers => { registrations: 'registrations' }
	  
	resources :questions

	root 'questions#index'

end

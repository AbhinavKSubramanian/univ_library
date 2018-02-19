Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :books do
	member do
	get 'assign'
	end
	end
  resources :students#plural
  root 'welcome#index'
end

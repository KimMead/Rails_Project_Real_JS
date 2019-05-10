Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :states
root 'welcome#home'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create' 

get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

get '/logout', to: 'sessions#destroy'

resources :users 

resources :trips 
 
resources :states do
    resources :trips, only: [:new, :create, :index]
end 

end

Rails.application.routes.draw do
  
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get '/signup' => 'members#new'
  post '/signup' => 'members#create'
  resources :members
  resources :roles
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  root 'scenes#index'
  resources :scenes do
     resources :posts do
       resources :comments
     end
  end
  
end

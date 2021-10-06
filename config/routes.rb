Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  root "pages#index"
 get 'pages/help'
 get 'pages/link' 
 
 get    '/login',  to: 'sessions#new'
 post   '/login',  to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
  
 resources :users
 resources :topics
 resources :comments
  get 'comments/new'
  post '/comments', to: 'comment#create'
 
 get 'favorites/index'
 post '/favorites', to: 'favorites#create'
 delete '/favorites', to: 'favorites#destroy'
 
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

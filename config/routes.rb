Rails.application.routes.draw do
  get '/' => 'vinyls#index'
  get '/vinyls' => 'vinyls#index'
  get '/vinyls/random' => 'vinyls#random'

  get '/vinyls/chat' => 'vinyls#chat'

  get '/vinyls/new' => 'vinyls#new'
  post '/vinyls' => 'vinyls#create'

  get '/vinyls/:id' => 'vinyls#show'

  get '/vinyls/:id/edit' => 'vinyls#edit'
  patch '/vinyls/:id' => 'vinyls#update'

  delete '/vinyls/:id' => 'vinyls#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end  
  # get '/vinyls/new' => 'vinyls#new'
  # get '/' => 'vinyls#all_artists'
  # get '/artist' => 'vinyls#artist'


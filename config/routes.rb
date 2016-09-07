Rails.application.routes.draw do
  get '/' => 'vinyls#index'
  get '/vinyls' => 'vinyls#index'

  get '/vinyls/chat' => 'vinyls#chat'

  get '/vinyls/new' => 'vinyls#new'
  post '/vinyls' => 'vinyls#create'

  get '/vinyls/:id' => 'vinyls#show'

  get '/vinyls/:id/edit' => 'vinyls#edit'
  patch '/vinyls/:id' => 'vinyls#update'

  delete '/vinyls/:id' => 'vinyls#destroy'
end  
  # get '/vinyls/new' => 'vinyls#new'
  # get '/' => 'vinyls#all_artists'
  # get '/artist' => 'vinyls#artist'


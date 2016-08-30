Rails.application.routes.draw do
  get "/" => "vinyls#all_artists"
  get "/artist" => "vinyls#artist"
end

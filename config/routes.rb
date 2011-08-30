WriteonlymodeCom::Application.routes.draw do
  root :to => 'statuses#index', :via => :get
  post '/' => 'statuses#update'
  match '/auth/:provider/callback' => 'sessions#create'
end

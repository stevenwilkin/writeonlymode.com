WriteonlymodeCom::Application.routes.draw do
  root :to => 'statuses#index'
  match '/auth/:provider/callback' => 'sessions#create'
end

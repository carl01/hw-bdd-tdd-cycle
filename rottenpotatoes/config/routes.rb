Rottenpotatoes::Application.routes.draw do
  resources :movies do
  #   member do
  #     get 'find_with_same_director'
  #   end
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/find_with_same_director/:id', to: 'movies#find_with_same_director'
end
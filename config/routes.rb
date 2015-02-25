Rails.application.routes.draw do
  root 'site#index'
  resources :movies
  resources :actors

  #tim added
  # add_actor POST /movies/:id/actors/new   movies#add_actor
  # remove_actor DELETE /movies/:id/actors/:actor_id  movie#remove_movie

  # add_movie POST /actors/:id/movies/new
  # remove_movie DELETE /actors/:id/movies/:movie_id
end

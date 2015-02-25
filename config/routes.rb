Rails.application.routes.draw do

  resources :movies do
    resources :comments, shallow: true
  end

  resources :actors do
    resources :comments, shallow: true
  end

  post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie

  post '/actors/:actor_id/comment' => 'comment#create', as: :actor_comments_new
  post '/movies/:movie_id/comment' => 'comment#create', as: :movie_comments_new

  root 'site#index'

end

#             Prefix Verb   URI Pattern                              Controller#Action
#     movie_comments GET    /movies/:movie_id/comments(.:format)     comments#index
#                    POST   /movies/:movie_id/comments(.:format)     comments#create
#  new_movie_comment GET    /movies/:movie_id/comments/new(.:format) comments#new
#       edit_comment GET    /comments/:id/edit(.:format)             comments#edit
#            comment GET    /comments/:id(.:format)                  comments#show
#                    PATCH  /comments/:id(.:format)                  comments#update
#                    PUT    /comments/:id(.:format)                  comments#update
#                    DELETE /comments/:id(.:format)                  comments#destroy
#             movies GET    /movies(.:format)                        movies#index
#                    POST   /movies(.:format)                        movies#create
#          new_movie GET    /movies/new(.:format)                    movies#new
#         edit_movie GET    /movies/:id/edit(.:format)               movies#edit
#              movie GET    /movies/:id(.:format)                    movies#show
#                    PATCH  /movies/:id(.:format)                    movies#update
#                    PUT    /movies/:id(.:format)                    movies#update
#                    DELETE /movies/:id(.:format)                    movies#destroy
#     actor_comments GET    /actors/:actor_id/comments(.:format)     comments#index
#                    POST   /actors/:actor_id/comments(.:format)     comments#create
#  new_actor_comment GET    /actors/:actor_id/comments/new(.:format) comments#new
#                    GET    /comments/:id/edit(.:format)             comments#edit
#                    GET    /comments/:id(.:format)                  comments#show
#                    PATCH  /comments/:id(.:format)                  comments#update
#                    PUT    /comments/:id(.:format)                  comments#update
#                    DELETE /comments/:id(.:format)                  comments#destroy
#             actors GET    /actors(.:format)                        actors#index
#                    POST   /actors(.:format)                        actors#create
#          new_actor GET    /actors/new(.:format)                    actors#new
#         edit_actor GET    /actors/:id/edit(.:format)               actors#edit
#              actor GET    /actors/:id(.:format)                    actors#show
#                    PATCH  /actors/:id(.:format)                    actors#update
#                    PUT    /actors/:id(.:format)                    actors#update
#                    DELETE /actors/:id(.:format)                    actors#destroy
#          add_actor POST   /movies/:id/actors/new(.:format)         movies#add_actor
#       remove_actor DELETE /movies/:id/actors/:actor_id(.:format)   movies#remove_actor
#          add_movie POST   /actors/:id/movies/new(.:format)         actors#add_movie
#       remove_movie DELETE /actors/:id/movies/:movie_id(.:format)   actors#remove_movie
# actor_comments_new POST   /actors/:actor_id/comment(.:format)      comment#create
# movie_comments_new POST   /movies/:movie_id/comment(.:format)      comment#create
#               root GET    /                                        site#index
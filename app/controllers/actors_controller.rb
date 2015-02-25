class ActorsController < ApplicationController
  
  before_action :set_actor, only: [:show, :edit, :update, :destroy, :add_movie, :remove_movie]

  def index
    @actors = Actor.all
  end

  def create
    form_data = params.require(:actor).permit(:name)
    Actor.create form_data
    redirect_to actors_path
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor_movies = @actor.movies.all
    @movies = Movie.all
    @moviesremain = @movies - @actor.movies
  end

  def add_movie
    movie = Movie.find(params[:movie_id])  # <=== id or movie_it??
    @actor.movies << movie
    redirect_to actors_path(@actor)
  end

  def remove_movie
    movie = Movie.find(params[:movie_id])
    actor.movies.destroy(movie)
    redirect_to actors_path(actor)
  end

  def show
    @movies_in = @actor.movies
    @actor_movies = @actor.movies.all
  end

  def update
    form_data = params.require(:actor).permit(:name)
    @actor.update_attributes form_data
    redirect_to actor_path(actor)
  end

  def destroy
    @actor.destroy
    redirect_to actors_path
  end

  private
  def set_actor
    @actor = Actor.find_by_id(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name)
  end
end

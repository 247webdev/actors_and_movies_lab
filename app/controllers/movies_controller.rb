class MoviesController < ApplicationController

  before_action :set_moive, only: [:show, :edit, :update, :destroy, :add_actor, :remove_actor]

  def index
    @movies = Movie.all
  end

  def create
    form_data = params.require(:movie).permit(:title, :year)
    Movie.create form_data
    redirect_to movies_path
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie_actors = @movie.actors.all
    @actorsremain = Actor.all - @movie.actors
  end

  def show
    @movie_actors = @movie.actors.all
  end

  def update
    form_data = params.require(:movie).permit(:title, :year)
    @movie.update_attributes form_data
    redirect_to movie_path(@movie)
  end

  def add_actor
    actor = Actor.find(params[:actor_id])
    @movie.actors << actor
    redirect_to movies_path(@movie)
  end

  def remove_actor
    actor = Actor.find(params[:actor_id])
    movie.actors.destroy(actor)
    redirect_to movie_path(movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

    private
  def set_movie
    @movie = Movie.find_by_id(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title)
  end
end


# <% form_tag add_movie_path do |m| %>
# <% end %>
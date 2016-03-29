<<<<<<< HEAD
private

def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
end

# This file is app/controllers/movies_controller.rb

class MoviesController < ApplicationController
=======
class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
>>>>>>> 5452bfba381f4f73b51ad145a3b12977950e3b75

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
<<<<<<< HEAD
    @all_ratings = ['G','PG','PG-13','R']
    @current_ratings = params[:ratings]
    @movies = Movie.order(params[:sort]).find_all_by_rating(if params[:ratings]; params[:ratings].keys; else; @all_ratings end)
    if params[:sort] == 'title asc'
      @class = 1
    elsif params[:sort] == 'release_date asc'
      @class = 2
    end
=======
    @movies = Movie.all
>>>>>>> 5452bfba381f4f73b51ad145a3b12977950e3b75
  end

  def new
    # default: render 'new' template
  end

  def create
<<<<<<< HEAD
    @movie = Movie.create!(params[:movie])
=======
    @movie = Movie.create!(movie_params)
>>>>>>> 5452bfba381f4f73b51ad145a3b12977950e3b75
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
<<<<<<< HEAD
    @movie.update_attributes!(params[:movie])
=======
    @movie.update_attributes!(movie_params)
>>>>>>> 5452bfba381f4f73b51ad145a3b12977950e3b75
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

<<<<<<< HEAD
end
=======
end
>>>>>>> 5452bfba381f4f73b51ad145a3b12977950e3b75

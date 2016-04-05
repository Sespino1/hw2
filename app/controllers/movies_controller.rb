class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    @direct = false
    @all_ratings = Movie.all_ratings
    
    if params[:ratings]
		  @ratings = params[:ratings]
	  elsif session[:ratings]
		  @ratings = session[:ratings]
		  @direct = true
	  else
		  @ratings = { 'G' => '1', 'PG' => '1', 'PG-13' => '1', 'R' => '1'}
	  end
	
	  @selected = @ratings.keys
	
  	if params[:sort]
  		@sort = params[:sort]
  	elsif session[:sort]
  		@sort = session[:sort]
  		@direct = true
  	else
  		@sort = 'title'
  	end
  	
  	if @direct
  		redirect_to movies_path(:sort => @sort, :ratings => @ratings)
  	end
	
  	@movies = @movies.select{ |movie| @ratings.has_key?(movie.rating) }
  	
  	if params[:commit] == 'Refresh'
  		session[:ratings] = params[:ratings]
  	end
  	
  	if @sort == 'title'
  		@movies = @movies.sort_by{ |movie| movie.title }
  	elsif @sort == 'release_date'
  		@movies = @movies.sort_by{ |movie| movie.release_date }
  	end
  	
  	instance_eval %Q" @hilite_#{params[:sort]} = true"
  	
  	session[:sort] = @sort
  	session[:ratings] = @ratings
    end

  def new
   
  end

  def create
    #@movie = Movie.create!(params[:movie]) #old way
    @movie = Movie.create!(movie_params)  # new way
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])  # old way
    @movie.update_attributes!(movie_params)  # new way  
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
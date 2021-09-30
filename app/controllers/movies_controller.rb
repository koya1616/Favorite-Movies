class MoviesController < ApplicationController
  
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movie_path(@movie.id),notice: "You have created movie successfully."
    else
      @movies = Movie.all
      @user = current_user
      render :index
    end
  end
  
  def index
    @movie = Movie.new
    @movies = Movie.page(params[:page]).reverse_order
    @user = current_user
  end
  
  def show
    @movie_new = Movie.new
    @movie = Movie.find(params[:id])
    @user = @movie.user
    @movie_comment = MovieComment.new
  end
  
  def edit
    @movie = Movie.find(params[:id])
    if @movie.user != current_user
      redirect_to movies_path
    end
  end
  
  def update
   @movie = Movie.find(params[:id])
   if @movie.update(movie_params)
     redirect_to movie_path(@movie),notice: "You have updated movie successfully."
   else
     render :edit
   end
  end
  
  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :body)
  end
  
end

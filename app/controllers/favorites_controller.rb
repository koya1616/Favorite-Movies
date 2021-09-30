class FavoritesController < ApplicationController
  
  def create
    movie_id = Movie.find(params[:movie_id])
    favorite = current_user.favorites.new(movie_id: movie_id.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    movie_id = Movie.find(params[:movie_id])
    favorite = current_user.favorites.find_by(movie_id: movie_id.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end

class FavoritesController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def index
    @favorite = Favorite.where(user_id: current_user.id)
  end

  def create
     if @favorite = Favorite.create(user_id: current_user.id, movie_id: @movie.id)
      redirect_to movie_path(@movie.id)
    else
      render movie_path(@movie.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, movie_id: @movie.id)
    @favorite.destroy
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end

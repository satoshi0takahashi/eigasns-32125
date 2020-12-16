class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    binding.pry
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  private

  def movie_params
    params.require(:movie).permit(:name, :detail, :category_id, :release_date_id, :country_id, :image)
  end
end

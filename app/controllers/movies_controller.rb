class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_movie, only: [:edit, :show]
  def index
    @movies = Movie.all.order('created_at DESC')
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: current_user.id).order('created_at DESC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @count = Evaluation.count
    @point = Evaluation.sum(:point)
    @points = (@point / @count).floor(2)
  end

  def edit
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def search
    @movies = Movie.search(params[:keyword])
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :detail, :category_id, :release_date_id, :country_id, :image)
  end
end

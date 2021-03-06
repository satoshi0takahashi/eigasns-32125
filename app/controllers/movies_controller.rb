class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_movie, only: [:edit, :show]
  def index
    @movies = Movie.all.order('created_at DESC')
    @tweet = Tweet.new
    @evaluations = Evaluation.all.order('created_at DESC').first(5)

    if user_signed_in? && current_user.tweet.present?
      @tweets = Tweet.where(user_id: current_user.id).order('created_at DESC')
    end

    if user_signed_in? && current_user.follower.present?
    @relation = Relationship.find_by(follower_id: current_user.id)
    @tweets = Tweet.where(user_id: [current_user.id, @relation.followed_id]).order('created_at DESC')
    
    end


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
    @evaluation = Evaluation.new(evaluation_params)
    @evaluations = Evaluation.where(movie_id: params[:id])
    @eva = @evaluations.find_by(user_id: current_user.id)
    @count = @evaluations.count
    @point = @evaluations.sum(:point)
    if @point != 0
    @points = (@point / @count).floor(2)
    end
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

  def evaluation_params
    params.permit(:title, :content, :point, :spoiler).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end

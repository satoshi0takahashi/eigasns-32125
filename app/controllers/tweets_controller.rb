class TweetsController < ApplicationController

  def index
    @tweets = Tweet.find(Tweet.user_id)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end
end
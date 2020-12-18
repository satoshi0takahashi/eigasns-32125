class EvaluationsController < ApplicationController
  def new
    @evaluation = Evaluation.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.valid?
      @evaluation.save
      redirect_to movie_path(@evaluation.movie_id)
    else
      render movie_path(@evaluation.movie_id)
    end
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.valid?
      @evaluation.update
      redirect_to movie_path(@evaluation.movie_id)
    else
      render movie_path(@evaluation.movie_id)
    end
  end

  private

  def evaluation_params
    params.permit(:title, :content, :point, :spoiler).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end

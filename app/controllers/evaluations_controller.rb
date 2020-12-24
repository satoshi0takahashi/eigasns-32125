class EvaluationsController < ApplicationController
  def new
    @evaluation = Evaluation.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.valid?
      @evaluation.save
      redirect_to movie_path(@movie.id)
    else
      render :show
    end
  end

  def update
    @movie = Movie.find_by(id: params[:movie_id])
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      redirect_to movie_path(@movie.id)
    else
      render movie_path(@movie.id), formats: :html
    end
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def destroy
    @eva = Evaluation.find(params[:id])
    @eva.destroy
    redirect_to root_path
  end

  private

  def evaluation_params
    params.permit(:title, :content, :point, :spoiler).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end

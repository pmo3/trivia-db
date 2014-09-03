class TriviaQuestionsController < ApplicationController
  def index
    render json: TriviaQuestion.all, :callback => params[:callback]
  end

  def show
    render json: TriviaQuestion.find(params[:id]), :callback => params[:callback]
  end

  def category
    questions = TriviaQuestion.where("category = ?", params[:category])
    render :json => questions.shuffle.first(10), :callback => params[:callback]
  end
end

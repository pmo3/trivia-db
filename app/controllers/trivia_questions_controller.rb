class TriviaQuestionsController < ApplicationController
  def index
    render json: TriviaQuestion.all
  end

  def show
    render json: TriviaQuestion.find(params[:id])
  end

  def category
    questions = TriviaQuestion.where("category = ?", params[:category])
    render :json => questions.shuffle.first(10)
  end
end

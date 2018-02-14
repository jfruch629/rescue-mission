class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    # @answers = Answer.all
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.product
 end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id].to_i)
    @answer = Answer.new(answer_params)
    @answer.question = @question
  if @answer.save
        flash[:notice] = 'Answer has been successfully created'
      else
        flash[:notice] = 'We want strong answers, so please provide your explanation with at least 50 characters.'
      end
      redirect_to question_path(@question.id)
    end

  private
    def set_answers
      @question = Question.find(params[:id])
      @answers = Answer.all.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content)
    end
end

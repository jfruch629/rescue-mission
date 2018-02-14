class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    @questions = Question.all.order('created_at DESC')
    flash[:notice] = "Your question has been deleted."
    render action: "index"
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :'/questions/new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description)
    end
end

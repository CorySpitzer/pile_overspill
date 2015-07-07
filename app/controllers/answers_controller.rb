class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end


  def create
    @question = Question.find(params[:question_id])
    # user id is not in the url because it isn't in the url
    # (because of no deep nesting)
    # So we get user id from the @question
    @user = User.find(@question.user_id)
    @answer = @question.answers.create(answer_params)
    if @answer.save
      flash[:notice] = "Answer added!"
    else
      flash[:alert] = "There was an issue adding your answer; please try again"
    end
    redirect_to user_question_path(@user, @question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end


end

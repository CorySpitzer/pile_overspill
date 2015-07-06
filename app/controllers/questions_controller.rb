class QuestionsController < ApplicationController


  #new is for when the 'new' view loads;
  def new
    @question = Question.new
  end

  #create is for succesfully saving the class instance to the database

  def create
    @question = Question.create(question_params)

    if @question.save
      flash[:notice] = "Question succesfully added"
      redirect_to question_path @question.id
    else
      flash[:alert] = "There was an issue adding your question; please try again."
      redirect_to new_question_path
    end
  end

  def show
    @question = Question.find(params[:id])
    #implicit: render :show
  end

  private

  def question_params
    params.require(:question).permit(:heading, :content)
  end

end

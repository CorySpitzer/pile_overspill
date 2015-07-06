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
      render :show
    else
      flash[:alert] = "There was an issue adding your question; please try again."
      redirect_to new_question_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:heading, :content)
  end

end

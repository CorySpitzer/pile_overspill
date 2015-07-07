class QuestionsController < ApplicationController


  #new is for when the 'new' view loads;
  def new
    @user = User.find(params[:user_id])
    @question = @user.questions.new
  end

  #create is for succesfully saving the class instance to the database

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.create(question_params)

    if @question.save
      flash[:notice] = "Question succesfully added"
      #objects passed into path must appear in same order they do in path, as seen below:
      redirect_to user_question_path(@user, @question)
    else
      flash[:alert] = "There was an issue adding your question; please try again."
      redirect_to new_user_question_path
    end
  end

  def show
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @answers = @question.answers
    #implicit: render :show
  end

  def edit
    @question = Question.find(params[:id])
    user_id = @question.user_id
    @user = User.find(params[user_id])
  end

  def update
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated"
      redirect_to question_path(@question)
    else
      render :edit
    end

  end



  private

  def question_params
    params.require(:question).permit(:heading, :content)
  end
  #
  # def user_params
  #   params.require(:user).permit(:id)
  # end

end

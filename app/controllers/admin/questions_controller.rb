class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.all
    @users = User.all
  end

  def destroy; end
end

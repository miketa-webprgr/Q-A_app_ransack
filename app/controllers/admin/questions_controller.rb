class Admin::QuestionsController < Admin::BaseController
  def index
    # @questions = Question.all
    # @users = User.all

    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
    @users = User.all
  end

  def destroy; end
end

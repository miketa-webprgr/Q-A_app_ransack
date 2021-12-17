class Admin::QuestionsController < Admin::BaseController
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(5)
    @users = User.all
  end

  def destroy; end
end

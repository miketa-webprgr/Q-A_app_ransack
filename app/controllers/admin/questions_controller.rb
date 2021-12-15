class Admin::QuestionsController < ApplicationController
  before_action :require_admin

  def index
    @questions = Question.all
    @users = User.all
  end

  def destroy
    #
  end

  private

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end

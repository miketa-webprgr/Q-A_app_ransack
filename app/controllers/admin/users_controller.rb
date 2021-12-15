class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
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

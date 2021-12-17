class Admin::UsersController < Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def destroy; end
end

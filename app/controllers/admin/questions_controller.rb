class Admin::QuestionsController < Admin::BaseController
  def index
    @q = Question.ransack(params[:q])

    if params[:solved] == 'true'
      @questions =
        @q.result(distinct: true).where(solved: true).page(params[:page]).per(5)
    elsif params[:solved] == 'false'
      @questions =
        @q
          .result(distinct: true)
          .where(solved: false)
          .page(params[:page])
          .per(5)
    else
      @questions = @q.result(distinct: true).page(params[:page]).per(5)
    end
    @users = User.all
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_questions_url,
                notice: "質問「#{question.title}」を削除しました。"
  end
end

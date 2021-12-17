class QuestionsController < BaseController
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

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @user = User.find(@question.user_id)
  end

  def new
    @question = Question.new
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    question = current_user.questions.find(params[:id])
    question.update!(question_params)
    redirect_to questions_url,
                notice: "質問「#{question.title}」を更新しました。"
  end

  def destroy
    question = current_user.questions.find(params[:id])
    question.destroy
    redirect_to questions_url,
                notice: "質問「#{question.title}」を削除しました。"
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      UserMailer.send_questioned_email(@question)
      redirect_to @question,
                  notice: "質問「#{@question.title}」を登録しました。"
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :solved)
  end
end

class QuestionsController < BaseController
  def index
    @questions = Question.all
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

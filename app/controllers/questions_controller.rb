class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def show
    @question = current_user.questions.find(params[:id])
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
    params.require(:question).permit(:title, :content)
  end
end

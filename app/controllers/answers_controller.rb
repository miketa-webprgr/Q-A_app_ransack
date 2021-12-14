class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    @question = Question.find(params[:question_id])

    if @answer.save
      redirect_to question_url(@question), notice: '回答を登録しました。'
    else
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end

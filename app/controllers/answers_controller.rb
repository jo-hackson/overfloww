class AnswersController < ActionController::Base

def create
	@question = Question.find(params[:question_id])
	@answer = @question.answers.create(answer_params)
	@answer.user_id = current_user.id
	@answer.save
	redirect_to question_path(@question)
end

private
	def comment_params
		params.require(:comment).permit(:body)
	end

end

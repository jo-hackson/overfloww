class CommentsController < ActionController::Base

	# http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def new
		binding.pry
		@comment = Comment.new
	end

	# post, after comment new form gets submitted
	def create
		@question = Question.find(params[:question_id])
		@comment = @question.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to question_path(@question)
		binding.pry


		# @comment = current_user.comments.build(comment_params)
		# @comment.commentable_id = params[:question_id]
		# @comment.commentable_type = "question"
		# @comment.save
		# binding.pry
		# redirect_to question_path
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

end

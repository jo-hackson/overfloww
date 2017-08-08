class QuestionsController < ApplicationController
	

# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = current_user.questions.build
	end

	def edit
		@question = Question.find(params[:id])
	end

	def create
		# question = Question.new
		# question.created_by = current_user.id # I do not have created_by but have user_id
		# question.attributes = question_params
		# question.save

		# or

		params["question"]["user_id"] = current_user.id
		@question = current_user.questions.build(question_params)
		@question.save
		respond_to do |format|
			format.html { redirect_to questions_path }
			format.js
		end
		

	end

	def update
		@question = Question.find(params[:id])

		if @question.update(question_params)
			redirect_to questions_path
		else
			render 'edit'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to questions_path
	end

	private
		def question_params
			# should remove user_id from permitted?
			params.require(:question).permit(:title, :body, :user_id)
		end

end
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
		params["question"]["user_id"] = current_user.id
		@question = current_user.questions.build(question_params)
		@question.save
		redirect_to questions_path
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
	end

	private
		def question_params
			params.require(:question).permit(:title, :body, :user_id)
		end

end
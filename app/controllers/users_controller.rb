class UsersController < ApplicationController

	def index

	end
	
	def create
		
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
		end

end
class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  # before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
end

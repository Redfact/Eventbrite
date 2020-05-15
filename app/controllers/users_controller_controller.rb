class UsersControllerController < ApplicationController
	before_action :authenticate_user , only: [:show,:edit,:update,:destroy]

	def authenticate_user
			unless user_signed_in?
				redirect_to new_user_session_path
			end
	end

	def show
	  	puts "Controller User show"
	  	@user = User.find(params[:id])
	end

	def update
		
	end

	def edit
		
	end

	def destroy
		
	end
  	
end

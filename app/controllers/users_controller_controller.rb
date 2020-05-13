class UsersControllerController < ApplicationController
	before_action :authenticate_user , only: [:show,:edit]

	def authenticate_user
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end

  def show
  	puts "Controller User show"
  end
  	
end

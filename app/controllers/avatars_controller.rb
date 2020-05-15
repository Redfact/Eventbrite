class AvatarsController < ApplicationController
def create
    @user = User.find(params[:users_controller_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(users_controller_path(@user))
end
end

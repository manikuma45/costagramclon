class UsersController < ApplicationController
	before_action :set_message, only: [:edit]

def new
	@user = User.new
end

def edit
	
end

def create
	@user = User.new(user_params)
	if @user.save
	   redirect_to user_path(@user.id)
	else
		render 'new'
	end
end

def show
		@user = User.find(params[:id])
	end

private

def set_message
      @user = User.find(params[:id])
end


def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
end

end

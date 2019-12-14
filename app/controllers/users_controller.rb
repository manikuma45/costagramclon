class UsersController < ApplicationController
	before_action :set_message, only: [:edit, :show, :update]

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
	end

	def update
		if current_user == @user
			if @user.update(user_params)
				flash[:success] = 'ユーザー情報を編集しました！'
				render :show
			else
				flash.now[:danger] = 'ユーザー情報の編集に失敗しました！！'
				render :edit
			end	
		else
			flash[:dender]= '他人のプロフィール情報は編集できません！'
			redirect_to  @user
		end
	end

	private

	def set_message
		@user = User.find(params[:id])
	end


	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
	end

end

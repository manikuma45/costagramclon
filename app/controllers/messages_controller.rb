class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :restrict_to_user, only: [:edit, :update, :destroy]
  def index
    @messages = Message.all
  end

  def show
    @favorite = current_user.favorites.find_by(message_id: @message.id)
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      MessageMailer.message_mail(@message).deliver
      redirect_to @message, notice: '投稿しました！'
    else
      render :new, notice: '投稿に失敗しました！'
    end

  end

  def update
    if current_user.id == @message.user_id
    if @message.update(message_params)
     redirect_to @message, notice: 'Message was successfully updated.' 
   else
    flash.now[:danger] = 'ユーザー情報の編集に失敗しました！！'
    render :edit
  end
  flash.now[:danger] = 'ユーザー情報の編集に失敗しました！！'
  end
  end

def destroy
  @message.destroy
  redirect_to messages_url, notice: 'Message was successfully destroyed.' 
end

private

def restrict_to_user
  unless current_user == @message.user
  flash[:alert] = "あなたの投稿ではありません！"
  redirect_to root_path
end
end

def set_message
  @message = Message.find(params[:id])
end

def message_params
  params.require(:message).permit(:content, :image, :image_cache)
end
end

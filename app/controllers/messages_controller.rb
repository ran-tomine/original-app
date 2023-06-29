class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    
    if @message.save
      image_url = url_for(@message.image) if @message.image.attached?
      MessageChannel.broadcast_to @room, { message: @message, user: @message.user, image: image_url } # image_urlを追加
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
    
    
    puts url_for(@message.image) if @message.image.attached?  # 追加する行
  end
  

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end

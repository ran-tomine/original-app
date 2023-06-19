class MessageChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find(params[:room_id]) # 追記
    stream_for @room # 追記
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

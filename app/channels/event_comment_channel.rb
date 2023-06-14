class EventCommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "event_comment_channel" #追加
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

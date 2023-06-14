class ChildcareCommentChannel < ApplicationCable::Channel
  def subscribed
    @childcare = Childcare.find(params[:childcare_id]) # 追記
    stream_for @childcare # 追記
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

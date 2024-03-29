class EventCommentsController < ApplicationController
  def create
    @event_comment = EventComment.new(event_comment_params)
    @event = Event.find(params[:event_id]) #追加
    if @event_comment.save
      EventCommentChannel.broadcast_to @event, { event_comment: @event_comment, user: @event_comment.user } #追加
    end
  end

  private
  def event_comment_params
    params.require(:event_comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end

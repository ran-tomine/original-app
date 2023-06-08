class EventCommentsController < ApplicationController
  def create
    @event_comment = EventComment.new(event_comment_params)
    if @event_comment.save
      redirect_to event_path(@event_comment.event)
    else
      @event = @event_comment.event
      @event_comments = @event.event_comments
      render "events/show"
    end
  end

  private
  def event_comment_params
    params.require(:event_comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end

class ChildcareCommentsController < ApplicationController
  def create
    @childcare_comment = ChildcareComment.new(childcare_comment_params)
    if @childcare_comment.save
      ActionCable.server.broadcast "childcare_comment_channel", {childcare_comment: @childcare_comment, user: @childcare_comment.user} #追加
    end
  end

  private
  def childcare_comment_params
    params.require(:childcare_comment).permit(:content).merge(user_id: current_user.id, childcare_id: params[:childcare_id])
  end

end

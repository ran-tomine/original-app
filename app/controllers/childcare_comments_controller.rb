class ChildcareCommentsController < ApplicationController
  def create
    @childcare_comment = ChildcareComment.new(childcare_comment_params)
    @childcare = Childcare.find(params[:childcare_id]) #追加
    if @childcare_comment.save
      ChildcareCommentChannel.broadcast_to @childcare, { childcare_comment: @childcare_comment, user: @childcare_comment.user } #追加
    end
  end

  private
  def childcare_comment_params
    params.require(:childcare_comment).permit(:content).merge(user_id: current_user.id, childcare_id: params[:childcare_id])
  end

end

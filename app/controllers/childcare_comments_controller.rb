class ChildcareCommentsController < ApplicationController
  def create
    @childcare_comment = ChildcareComment.new(childcare_comment_params)
    if @childcare_comment.save
      redirect_to childcare_path(@childcare_comment.childcare)
    else
      @childcare = @childcare_comment.childcare
      @childcare_comments = @childcare.childcare_comments
      render "childcares/show"
    end
  end

  private
  def childcare_comment_params
    params.require(:childcare_comment).permit(:content).merge(user_id: current_user.id, childcare_id: params[:childcare_id])
  end

end

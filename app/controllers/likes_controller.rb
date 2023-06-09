class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.build(childcare_id: params[:childcare_id])
    like.save
    render 'childcares/destroy.js.erb'
  end

  def destroy
    like = Like.find_by(childcare_id: params[:childcare_id], user_id: current_user.id)
      like.destroy
      render 'childcares/destroy.js.erb'
  end

  def set_tweet
    @childcare = Childcare.find(params[:childcare_id])
  end
end

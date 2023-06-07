class ChildcaresController < ApplicationController
  def index
    
  end


  private

  def childcares_params
    params.require(:childcare).permit(:title,:diary ,:image).merge(user_id: current_user.id)
  end
end

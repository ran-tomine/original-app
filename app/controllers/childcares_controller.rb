class ChildcaresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  
  def index
    @childcare = Childcare.all
  end

  def new
    @childcare = Childcare.new
  end

  def create
    @childcare = Childcare.new(childcare_params)
    if @childcare.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @childcare = Childcare.find(params[:id])
  end


  private

  def childcare_params
    params.require(:childcare).permit(:title,:diary ,:image).merge(user_id: current_user.id)
  end
end

class ChildcaresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :search]
  
  def index
    @childcares = Childcare.all
    @events = Event.all
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
    @childcare_comment = ChildcareComment.new
    @childcare_comments =@childcare.childcare_comments.includes(:user)
  end

  def edit
    @childcare = Childcare.find(params[:id])
    unless user_signed_in? && current_user == @childcare.user
      redirect_to action: :index
    end
  end

  def update
    @childcare = Childcare.find(params[:id])
    if @childcare.update(childcare_params)
      redirect_to childcare_path
    else
      render :edit
    end
  end

  def destroy
    childcare = Childcare.find(params[:id])
    childcare.likes.destroy_all # 関連するlikesレコードを削除
    childcare.destroy
    redirect_to root_path
  end

  def search
    @childcares = Childcare.search(params[:keyword])
    @events = Event.search(params[:keyword])
    
  end

  private

  def childcare_params
    params.require(:childcare).permit(:title,:diary ,:image).merge(user_id: current_user.id)
  end
end

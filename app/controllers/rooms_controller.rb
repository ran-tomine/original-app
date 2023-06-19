class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    user_ids = params[:room][:user_ids].reject(&:empty?) # 空の値を排除する
  
    if user_ids.size == 1 && user_ids.first.to_i == current_user.id
      flash[:error] = "チャットメンバーを選択してください。"
      redirect_to new_room_path
      return
    end
  
  
    if user_ids.empty?
      flash[:error] = "チャットメンバーを選択してください。"
      redirect_to new_room_path
      return
    end
  
    user_names = User.where(id: user_ids).pluck(:nickname)
    room_name = user_names.join(', ')
  
    @room = Room.new(name: room_name, user_ids: user_ids)
  
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end

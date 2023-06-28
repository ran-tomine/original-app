class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless user_signed_in? && current_user == @user
      redirect_to action: :index
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    # 外部キー制約を一時的に無効化
    ActiveRecord::Base.transaction do
    begin
    ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS=0")

    @user.childcares.destroy_all
    @user.events.destroy_all
    @user.childcare_comments.destroy_all
    @user.event_comments.destroy_all
    @user.rooms.destroy_all
    @user.messages.destroy_all

     # ユーザーの削除
    @user.destroy

    # 外部キー制約を再度有効化
    ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS=1")

    redirect_to root_path
  rescue StandardError => e
    # エラーハンドリング
    # 例外が発生した場合にロールバックなどの処理を行うことができます
    raise e
  end
end
end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :image)
  end
end

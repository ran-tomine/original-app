require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)  # Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
  end
end

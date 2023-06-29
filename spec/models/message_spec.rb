require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it '文字と画像が存在していれば保存できる' do
        expect(@message).to be_valid
      end
      it '文字が空でも保存できる' do
        @message.content = nil
        expect(@message).to be_valid
      end
      it '画像が空でも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it '文字と画像が空では保存できない' do
        @message.content = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("文字を入力してください")
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('ルームを入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end

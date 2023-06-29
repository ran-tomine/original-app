require 'rails_helper'

RSpec.describe EventComment, type: :model do
  before do
    @event_comment = FactoryBot.build(:event_comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it '文字が存在していれば保存できる' do
        expect(@event_comment).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it '文字が空では保存できない' do
        @event_comment.content = nil
        @event_comment.valid?
        expect(@event_comment.errors.full_messages).to include("文字を入力してください")
      end
      it 'ユーザが紐付いていないと保存できない' do
        @event_comment.user = nil
        @event_comment.valid?
        expect(@event_comment.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'イベントが紐付いていないと保存できない' do
        @event_comment.event = nil
        @event_comment.valid?
        expect(@event_comment.errors.full_messages).to include('イベントを入力してください')
      end
    end
  end
end

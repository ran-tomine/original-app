require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね投稿' do
    context 'いいねが投稿できる場合' do
      it 'ユーザーと育児日記が紐付いていたら投稿できる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねが投稿できない場合' do
      it 'ユーザが紐付いていないと保存できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'ユーザが紐付いていないと保存できない' do
        @like.childcare = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('育児日記を入力してください')
      end
    end
  end
end

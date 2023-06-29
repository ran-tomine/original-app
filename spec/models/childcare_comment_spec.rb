require 'rails_helper'

RSpec.describe ChildcareComment, type: :model do
  before do
    @childcare_comment = FactoryBot.build(:childcare_comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it '文字が存在していれば保存できる' do
        expect(@childcare_comment).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it '文字が空では保存できない' do
        @childcare_comment.content = nil
        @childcare_comment.valid?
        expect(@childcare_comment.errors.full_messages).to include("文字を入力してください")
      end
      it 'ユーザが紐付いていないと保存できない' do
        @childcare_comment.user = nil
        @childcare_comment.valid?
        expect(@childcare_comment.errors.full_messages).to include('ユーザーを入力してください')
      end
      it '育児日記が紐付いていないと保存できない' do
        @childcare_comment.childcare = nil
        @childcare_comment.valid?
        expect(@childcare_comment.errors.full_messages).to include('育児日記を入力してください')
      end
    end
  end
end

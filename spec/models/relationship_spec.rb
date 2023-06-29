require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @relationship = FactoryBot.build(:relationship)
  end

  describe 'フォロー、フォロワー投稿' do
    context 'フォロー、フォロワーが投稿できる場合' do
      it 'ユーザーが紐付いていたら投稿できる' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォロー、フォロワーが投稿できない場合' do
      it 'フォロワーが紐付いていないと保存できない' do
        @relationship.follower = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('フォロワーを入力してください')
      end
      it 'フォローが紐付いていないと保存できない' do
        @relationship.following = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('フォローを入力してください')
      end
    end
  end
end

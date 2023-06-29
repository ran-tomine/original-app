require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "ルーム名の値が存在すれば作成できる" do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "ルーム名が空では作成できない" do
        @room.name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("ルーム名を入力してください")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Childcare, type: :model do
  before do
    @childcare = FactoryBot.build(:childcare)
  end

  describe '育児日記の保存' do
    context "育児日記が保存できる場合" do
      it "画像、タイトル、日記の情報があれば育児日記は保存される" do
        expect(@childcare).to be_valid
      end
    end
  end
    context "育児日記が保存できない場合" do
      it "商品画像がないと保存できない" do
        @childcare.image = nil
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include("画像を入力してください")
      end
      it "タイトルがないと保存できない" do
        @childcare.title = nil
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'タイトルが30文字を超えると登録できない' do
        @childcare.title = 'a' * 31
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include('タイトルは30文字以内で入力してください')
      end
      it "日記がないと保存できない" do
        @childcare.diary = nil
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include("思い出を入力してください")
      end
      it '日記が1000文字を超えると登録できない' do
        @childcare.diary = 'a' * 1001
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include('思い出は1000文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @childcare.user = nil
        @childcare.valid?
        expect(@childcare.errors.full_messages).to include('Userを入力してください')
      end
    end
end

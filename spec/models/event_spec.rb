require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベントの保存' do
    context "イベントが保存できる場合" do
      it "画像、イベント名、場所、日付、説明、の情報があれば育児日記は保存される" do
        expect(@event).to be_valid
      end
    end
  end
    context "イベントが保存できない場合" do
      it "画像がないと保存できない" do
        @event.image = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("画像を入力してください")
      end
      it "イベント名がないと保存できない" do
        @event.name = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント名を入力してください")
      end
      it 'イベント名が30文字を超えると登録できない' do
        @event.name = 'a' * 31
        @event.valid?
        expect(@event.errors.full_messages).to include('イベント名は30文字以内で入力してください')
      end
      it "場所がないと保存できない" do
        @event.location = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("場所を入力してください")
      end
      it '場所が30文字を超えると登録できない' do
        @event.location = 'a' * 31
        @event.valid?
        expect(@event.errors.full_messages).to include('場所は30文字以内で入力してください')
      end
      it "日付がないと保存できない" do
        @event.datetime = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("日付時間を入力してください")
      end
      it '西暦が4桁でないと保存できない' do
        @event.datetime = DateTime.new(23, 7, 1, 12, 0, 0) # 2桁の西暦を設定
        @event.valid?
        expect(@event.errors.full_messages).to include('日付時間の西暦は4桁である必要があります。')
      end
      it '過去の日付の設定では保存できない' do
        @event.datetime = DateTime.new(2000, 1, 1, 0, 0, 0) # 過去の日時を設定
        @event.valid?
        expect(@event.errors.full_messages).to include('日付時間は未来の日時を設定してください。')
      end
      it "説明がないと保存できない" do
        @event.description = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("説明を入力してください")
      end
      it '説明が1000文字を超えると登録できない' do
        @event.description = 'a' * 1001
        @event.valid?
        expect(@event.errors.full_messages).to include('説明は1000文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('Userを入力してください')
      end
    end
end

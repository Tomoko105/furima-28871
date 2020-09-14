require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報登録' do
    context '登録がうまくいくとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it '紐づくユーザーが存在しないと保存できないこと' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像は1枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.explation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explation can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が必須であること' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden is not a number')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref must be other than 1")
      end
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999より小さいと登録不可であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が、¥300~¥9,999,999の間より大きいと登録不可あること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角数字のみ入力可能であること' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

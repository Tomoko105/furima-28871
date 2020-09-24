require 'rails_helper'

RSpec.describe Consumer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    # binding.pry
    @item.image = fixture_file_upload('public/images/test_image.png')
    @user_item = FactoryBot.build(:user_item, user_id: @user2.id, item_id: @item.id)
    @consumer = FactoryBot.build(:consumer, user_id: @user2.id, item_id: @item.id, user_item: @user_item.id)
  end

  describe '購入情報登録' do
    context '登録がうまくいくとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@consumer).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it '郵便番号が必須であること' do
        @consumer.postalcode = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号がハイフンが必要であること' do
        @consumer.postalcode = 1_234_567
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include('is invalid. Include hyphen(-)')
      end
      it '都道府県が必須であること' do
        @consumer.pref_id = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Pref_id can't be blank")
      end
      it '市区町村が必須であること' do
        @consumer.city = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @consumer.adress = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Adress can't be blank")
      end
      it '建物名が必須であること' do
        @consumer.buldname = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Buldname can't be blank")
      end
      it '電話番号が必須であること' do
        @consumer.tel = nil
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号はハイフン不要なこと' do
        @consumer.tel = '090-1234-5678'
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号は12桁以上でないこと' do
        @consumer.tel = '090123456789'
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include('Invalid octal digit')
      end
    end
  end
end

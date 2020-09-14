require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは＠を含む必要があること' do
        @user.email = 'adc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下であれば登録できないこと' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合であること' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名の名字が必須であること' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'ユーザー本名の名前が必須であること' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'ユーザー本名(姓)が全角（漢字・ひらがな・カタカナ）で入力でされていること' do
        @user.firstname = 'aa00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'ユーザー本名(名)が全角（漢字・ひらがな・カタカナ）で入力でされていること' do
        @user.lastname = 'aa00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'ユーザー本名のフリガナの名字が必須であること' do
        @user.kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana firstname can't be blank")
      end

      it 'ユーザー本名のフリガナの名前が必須であること' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
      end

      it 'ユーザー本名のフリガナは全角（カタカナ）であること' do
        @user.kana_firstname = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana firstname is invalid')
      end

      it 'ユーザー本名のフリガナは全角（カタカナ）であること' do
        @user.kana_lastname = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname is invalid')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end 

  describe 'ユーサー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、passwordconfirmation、first_name、last_name、kana_first_name、kana_last_naem、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが６文字以上で英数字混在であれば登録できる' do
        @user.password = '000yyy'
        expect(@user).to be_valid
      end
      it 'first_name、last_nameが全角文字であれば登録できる' do
        @user.first_name = 'テスト'
        @user.last_name = 'テスト'
        expect(@user).to be_valid
      end
      it 'kana_first_name、kana_last_nameが全角カタカナであれば登録できる' do
        @user.kana_first_name = 'テスト'
        @user.kana_last_name = 'テスト'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do

      it 'nicknameカラムが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password has to include number and alphabet")
      end
      it 'passwordとpassword_confirmationが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password has to include number and alphabet")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'emailが空だと登録できない'  do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '登録済みのemailと同じemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'first_name、last_nameが全角文字でなければ登録できない' do
        @user.first_name = 'test'
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name has to use full-width character")
        expect(@user.errors.full_messages).to include ("Last name has to use full-width character")
      end
      it 'kana_first_name、kana_last_nameが全角カタカナでなければ登録できない' do
          @user.kana_first_name = 'てすと'
          @user.kana_last_name = 'てすと'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Kana first name has to use full-width Katakana character")
          expect(@user.errors.full_messages).to include ("Kana last name has to use full-width Katakana character")
      end
      it 'birthdayカラムが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end  
    end  
  end
end

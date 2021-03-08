require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき'do
      it "nickname,email,password,password_confirmation,last_name,first_name,kana_last_name,kana_first_name,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき'do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じメールアドレスは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'hog.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが一致していないと登録ができない" do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英語のみでは登録出来ない" do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字のみでは登録出来ない" do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが全角では登録できないこと" do
        @user.password = 'AAAAAA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが６文字以上でないと登録できないこと" do
        @user.password = 'aaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do 
        @user.last_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 漢字、カタカナ、平仮名で入力してください')
      end
        it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 漢字、カタカナ、平仮名で入力してください')
      end
      it "kana_last_nameが空では登録できない" do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameが全角カタカナでなければ登録できないこと' do
        @user.kana_last_name = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name カタカナで入力してください')
      end
      it 'kana_last_nameが半角文字だと登録できないこと' do
        @user.kana_last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name カタカナで入力してください')
      end
      
      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameが全角カタカナでなければ登録できないこと' do
        @user.kana_first_name = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name カタカナで入力してください')
      end
      it 'kana_first_nameが半角文字だと登録できないこと' do
        @user.kana_first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name カタカナで入力してください')
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

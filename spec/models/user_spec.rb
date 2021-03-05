require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(email: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(password: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "last_nameが空では登録できない" do
      user = User.new(last_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(first_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "kana_last_nameが空では登録できない" do
      user = User.new(kana_last_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "kana_first_nameが空では登録できない" do
      user = User.new(kana_first_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end

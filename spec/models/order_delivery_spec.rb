require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe "商品購入機能" do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery,user_id: user.id,item_id: item.id)
    sleep(1)
  end

    it "全ての情報があれば保存ができること" do
      expect(@order_delivery).to be_valid
    end

  
    it "tokenが空では登録できないこと" do
      @order_delivery.token = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
    end
    
    it "postal_codeが空では登録できないこと" do
      @order_delivery.postal_code = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが半角数字以外では登録できないこと" do
      @order_delivery.postal_code = "aaa-aaaa"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "delivery_area_idが空では登録できないこと" do
      @order_delivery.delivery_area_id = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Delivery area can't be blank")
    end

    it "delivery_area_idが--では登録できないこと" do
      @order_delivery.delivery_area_id = 1
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it "municipalityが空では登録できないこと" do
      @order_delivery.municipality = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では登録できないこと" do
      @order_delivery.address = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @order_delivery.phone_number = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが半角数字以外では登録できないこと" do
      @order_delivery.phone_number = "aaaaaaaaaaa"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
    end

  end
end

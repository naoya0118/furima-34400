require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品できるとき'do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき'do
      it "titleが空だと登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "titleが41文字以上だと登録できない" do
        @item.title = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "explanationが1001文字以上だと登録できない" do
        @item.explanation = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price ", "Price is not included in the list")
      end
      it "priceが299円以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが9,999,999円以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが数字以外だと登録できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "state_idが空だと登録できない" do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end
      it "delivery_fee_idが空だと登録できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it "delivery_area_idが空だと登録できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area is not a number")
      end
      it "delivery_area_idが空だと登録できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area is not a number")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe "商品購入機能" do
    before do
      item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: item.user_id, item_id: item.id)
      sleep(0.1)
    end

    context "商品購入できるとき" do
      it "token, postal_code, prefecture_id, city, addresses, phone_number, user_id, item_idが存在すれば購入できること" do
        expect(@purchase_order).to be_valid
      end

      it "buildingは空でも購入できること" do
        @purchase_order.building = ''
        expect(@purchase_order).to be_valid
      end

      it "phone_numberは半角数字10文字でも購入できること" do
        @purchase_order.phone_number = '0123456789'
        expect(@purchase_order).to be_valid
      end

      it "phone_numberは半角数字11文字でも購入できること" do
        @purchase_order.phone_number = '01234567890'
        expect(@purchase_order).to be_valid
      end
    end

    context "商品購入できないとき" do
      it "tokenが空では購入できないこと" do
        @purchase_order.token = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できないこと" do
        @purchase_order.postal_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "cityが空では購入できないこと" do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end

      it "prefecture_idが初期値(id:1)では購入できないこと" do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "addressesが空では購入できないこと" do
        @purchase_order.addresses = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Addresses can't be blank")
      end

      it "phone_numberが空では購入できないこと" do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "userが紐付いていないと購入できないこと" do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていないと購入できないこと" do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end

      it "postal_codeにハイフンがなければ購入できないこと" do
        @purchase_order.postal_code = '1234567'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "postal_codeが全角文字では購入できないこと" do
        @purchase_order.postal_code = '郵便番号'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "postal_codeが英字では購入できないこと" do
        @purchase_order.postal_code = 'postal-code'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "phone_numberが9文字以下では購入できないこと" do
        @purchase_order.phone_number = '012345678'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is too short")
      end

      it "phone_numberにハイフンがあると購入できないこと" do
        @purchase_order.phone_number = '090-1234-5678'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it "phone_numberが全角文字では購入できないこと" do
        @purchase_order.phone_number = 'けいたいでんわばんごう'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it "phone_numberが英字では購入できないこと" do
        @purchase_order.phone_number = 'phonenumber'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end

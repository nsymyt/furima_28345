require 'rails_helper'

describe BuyInfo do
  before do
    @buyer = FactoryBot.build(:buy_info)
  end
  describe '商品の購入機能' do
    context '商品の購入がうまくいくとき' do
      it 'クレジットカード情報、postal_code、prefecture_id、city、house_number、phone_numberが存在すれば購入できる' do
        expect(@buyer).to be_valid
      end
    end
    context '商品の購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @buyer.postal_code = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank",)
      end
      it 'prefecture_idが1を選択した時、登録できない' do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと登録できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank",)
      end
      it 'house_numberが空だと登録できない' do
        @buyer.house_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("House number can't be blank",)
      end
      it 'phone_numberが空だと登録できない' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank",)
      end
      it 'phone_numberが空だと登録できない' do
        @buyer.phone_number = "080123456789"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)",)
      end
    end
  end
end

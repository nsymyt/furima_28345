require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/hero .jpg')
  end
  describe '商品の出品登録' do
    context '商品の出品登録がうまくいくとき' do
      it 'image、name、text、category_id、status_id、delivery_fee_id、prefecture_id、days_until_shipping、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_id	が1を選択した時、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_id	が1を選択した時、登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'delivery_fee_id	が1を選択した時、登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it 'prefecture_id	が1を選択した時、登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'days_until_shipping_id	が1を選択した時、登録できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days until shipping must be other than 1')
      end

      it 'price	が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'price	が300より小さい場合登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it 'price	が9999999より大きい場合登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end

class BuyInf
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

 #shipping_addressのバリデーション
  VALID_POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/

  with_options presence: true do
    validates :postal_code, format: {with: VALID_POSTAL_CODE_REGEX}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11}
  end

  def save
    #item_id取得のための設定
    item = Item.find(params[:item_id])
    #配送先住所の保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,building_name: building_name, phone_number: phone_number, items_id:items.id)
    #購入情報の保存
    Buy.crreate(items_id: item.id, user_id: current_user.id)
  end
end
class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  end

  with_options presence: true, numericality: { other_than: 1 } do
      validates :category_id
       validates :status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :days_until_shipping_id
  end
  
end

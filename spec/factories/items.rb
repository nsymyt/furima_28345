FactoryBot.define do
  factory :item do
    image { "item-image" }
    name { "アイウエオ" }
    text { "カキクケコ"}
    category_id {"2"}
    status_id { "2" }
    delivery_fee_id {"2" }
    prefecture_id { "2"}
    days_until_shipping_id { "2" }
    price { "3000" }

    association :user
  end
end

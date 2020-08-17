FactoryBot.define do
  factory :buy_info do
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    city          { '福岡市博多区' }
    house_number  { '東公園7-7' }
    phone_number  { '09012345678' }

  end
end
FactoryBot.define do
  Faker::Config.locale = :ja
  factory :buy_info do
    postal_code   { Faker::Address.postcode }
    prefecture_id { '2' }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    phone_number  { Faker::Number.number(digits: 11) }

  end
end
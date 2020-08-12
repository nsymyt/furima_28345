FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '佐藤' }
    last_name             { '太郎' }
    first_name_furigana   { 'サトウ' }
    last_name_furigana    { 'タロウ' }
    birthday_id { Faker::Date.in_date_period(year: 1990) }
  end
end

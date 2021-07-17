FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '全角' }
    first_name            { '全角' }
    last_name_kana        { 'ゼンカク' }
    first_name_kana       { 'ゼンカク' }
    birthday              { Faker::Date.in_date_period }
  end
end

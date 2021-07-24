FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    info                  { Faker::Lorem.sentence }
    price                 { Faker::Commerce.price(range: 300..9_999_999) }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    sales_status_id       { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id       { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end

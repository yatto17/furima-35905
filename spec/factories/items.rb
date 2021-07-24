FactoryBot.define do
  factory :item do
    name                  { Faker::Commerce.product_name }
    info                  { Faker::Lorem.sentence }
    price                 { Faker::Lorem.characters(number: 7, min_numeric: 7) }
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
# priceは下のどちらかでの実装なんじゃないかと思うので残しておく。現状は強引な気がする。
# Faker::Number.between(from: 300, to: 9999999)
# Faker::Commerce.price(range: 300..9999999)

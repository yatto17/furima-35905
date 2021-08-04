FactoryBot.define do
  factory :purchase_order do
    token         { "tok_abcdefghijk00000000000000000" }
    postal_code   { "123-4567"}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { "調布市"}
    addresses     { "布田2-47-1"}
    building      { "AXIS" }
    phone_number  { "09012345678"}
  end
end

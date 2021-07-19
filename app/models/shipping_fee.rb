class Shipping_fee < ActiveHash::Base
  self.date = [
    { id: 1, burden: '---' },
    { id: 2, burden: '着払い(購入者負担)' },
    { id: 3, burden: '送料込み(出品者負担)' }
  ]

  inclede ActiveHash::Associations
  has_many :items

end
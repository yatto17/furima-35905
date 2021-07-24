class Category < ActiveHash::Base
  self.data = [
    { id: 1, genre: '---' },
    { id: 2, genre: 'メンズ' },
    { id: 3, genre: 'レディース' },
    { id: 4, genre: 'ベビー・キッズ' },
    { id: 5, genre: 'インテリア・住まい・小物' },
    { id: 6, genre: '本・音楽・ゲーム' },
    { id: 7, genre: 'おもちゃ・ホビー・グッズ' },
    { id: 8, genre: '家電・スマホ・カメラ' },
    { id: 9, genre: 'スポーツ・レジャー' },
    { id: 10, genre: 'ハンドメイド' },
    { id: 11, genre: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end

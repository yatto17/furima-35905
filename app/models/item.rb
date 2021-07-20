class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :name, :info, :price, :item, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
             numericality: { other_than: 1, message: "can't be blank"}

end

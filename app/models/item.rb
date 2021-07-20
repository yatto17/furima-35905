class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :name, :info, :price, :image, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
             numericality: { other_than: 1, message: "can't be blank"}

end

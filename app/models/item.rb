class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many_attached :images
  has_one :purchase
  has_many :comments

  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :images
    validates :name
    validates :info
    validates :price
  end

  validate :before_type_cast
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'is out of setting range' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  private

  def before_type_cast
    errors.add(:price, 'is invalid. Input half-width characters') if price_before_type_cast =~ /\A\D|[a-z]+\z/
  end
end

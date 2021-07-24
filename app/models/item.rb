class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :image, :name, :info, presence: true
  validate :before_type_cast
  with_options presence: true,
               numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: 'is out of setting range' } do
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  private
  def before_type_cast
    unless self.price_before_type_cast =~ /\A[0-9]+\z/
      errors.add(:price, 'is invalid. Input half-width characters')
    end
  end
end
  # def before_type_cast
  #   self.price = self.price_before_type_cast
  # end
  # format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
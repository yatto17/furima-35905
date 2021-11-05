class ItemTagForm
  include ActiveModel::Model

  attr_accessor :name, :info, :price, :images, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :tag_name, :user_id, :item_id

  with_options presence: true do
    validates :images
    validates :name
    validates :info
    validates :price
    validates :tag_name
    validates :user_id
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

  def save
    item = Item.create(images: images, name: name, info: info, price: price, category_id: category_id, sales_status_id: sales_status_id,
                       shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTag.create(item_id: item.id, tag_id: tag.id)
  end

  def update
    @item = Item.where(id: item_id)
    item = @item.update(images: images, name: name, info: info, price: price, category_id: category_id, sales_status_id: sales_status_id,
                        shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    map = ItemTag.where(item_id: item_id)
    map.update(item_id: item_id, tag_id: tag.id)
  end

  private

  def before_type_cast
    errors.add(:price, 'is invalid. Input half-width characters') if price =~ /\A\D|[a-z]+\z/
  end
end
class Order < ApplicationRecord
  belongs_to :purchase

  belongs_to_active_hash :prefecture
end

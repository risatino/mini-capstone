class CartedProduct < ApplicationRecord
belongs_to :vinyl
belongs_to :user
belongs_to :order, optional: true

def subtotal
  quantity * vinyl.price
end
end

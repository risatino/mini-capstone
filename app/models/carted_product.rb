class CartedProduct < ApplicationRecord

validates :quantity, numericality: { greater_than: 0 }
validates :quantity, presence: true

belongs_to :order, optional: true
belongs_to :vinyl
belongs_to :user

  def subtotal
    quantity * vinyl.price
  end
end

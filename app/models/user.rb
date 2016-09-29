class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: /\w{2,}[@]\w+[.]\w{2,3}/,
    message: "must be valid email" }

  validates :name, uniqueness: true
  validates :name, presence: true

  has_secure_password
  has_many :orders
  has_many :carted_products
  has_many :vinyls, through: :carted_products

  def currently_carted
    carted_products.where(status: "carted")
  end
end

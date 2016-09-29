class Category < ApplicationRecord
  
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :category_vinyls
  has_many :vinyls, through: :category_vinyls
end

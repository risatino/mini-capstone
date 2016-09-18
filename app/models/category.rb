class Category < ApplicationRecord
  has_many :category_vinyls
  has_many :vinyls, through: :category_vinyls
end

class Supplier < ApplicationRecord

  validates :name, uniqueness: true
  validates :name, presence: true
  
  has_many :vinyls
end

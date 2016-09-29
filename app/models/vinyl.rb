
class Vinyl < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, presence: true
  validates :description, length: { in: 100..300}
  
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products
  has_many :orders
  has_many :category_vinyls
  has_many :categories, through: :category_vinyls


  def images
    Image.where(vinyl_id: self.id)    
  end
  
  def friendly_updated_at
    updated_at.strftime('%b %d, %Y')
  end

  def friendly_playtime
    message = ""  
    hours = playtime / 60
    minutes = playtime % 60

    message += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
    message += ", " if hours > 0 && minutes > 0
    message += "#{minutes} #{'Minute'.pluralize(minutes)}" if minutes > 0

    message
  end

  def sale_message
    if price.to_f < 10
      "Discount Item!" 
    else price > 10
      "On Sale!" 
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end

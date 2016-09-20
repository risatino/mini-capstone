class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :vinyls, through: :carted_products
  

  def pretty_created_at
    created_at.strftime("%A, %b %d")    
  end

  def id_present_to_customer
    2001 + id
  end

  def calculate_subtotal(vinyl_object)
    self.subtotal = vinyl_object.price * params[:quantity].to_i    
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end
end

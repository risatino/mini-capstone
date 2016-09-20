class CartedProductsController < ApplicationController
  
  def index
    # @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
    # @carted_products = User.find(current_user.id).carted_products.where("status LIKE ?", "carted")
    # @carted_products = current_user.carted_products.where("status = ?", "carted")
    # @carted_products = CartedProduct.where(status: "carted").where(user_id: current_user.id)
    @carted_products = current_user.carted_products.where(status: "carted")  
  end

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    @carted_product = CartedProduct.create(vinyl_id: params[:vinyl_id], 
                                          quantity: params[:quantity], 
                                          user_id: current_user.id, 
                                          status: "carted")

    flash[:success] = 'Item placed into cart'
    redirect_to '/carted_products'
  end
end

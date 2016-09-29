class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user && current_user.currently_carted.any?
      @carted_products = current_user.currently_carted 
    else
      flash[:warning] = "Please add items to cart."
      redirect_to '/'
    end
  end

  # def index
  #   # @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
  #   # @carted_products = User.find(current_user.id).carted_products.where("status LIKE ?", "carted")
  #   # @carted_products = current_user.carted_products.where("status = ?", "carted")
  #   # @carted_products = CartedProduct.where(status: "carted").where(user_id: current_user.id)
  # end

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    @carted_product = CartedProduct.create(vinyl_id: params[:vinyl_id], 
                                          quantity: params[:quantity], 
                                          user_id: current_user.id, 
                                          status: "carted")
    session[:cart_count] = nil
    flash[:success] = 'Item placed into cart'
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    
    session[:cart_count] = nil
    flash[:success] = "Product Removed From Cart"
    redirect_to "/carted_products"
  end
end
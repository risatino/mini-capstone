class CartedProductsController < ApplicationController
  
  def index
    @user_id = current_user.id
    @carted_products = CartedProduct.where(status: "carted").where(user_id: current_user.id)  
  end

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    @carted_product = CartedProduct.new(user_id: params[:user_id], vinyl_id: params[:vinyl_id], quantity: params[:quantity], status: "carted")

    @carted_product.save

    flash[:success] = 'Placed Into Cart'
    redirect_to "/carted_products"
  end

end

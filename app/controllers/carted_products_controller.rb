class CartedProductsController < ApplicationController

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    @carted_product = CartedProduct.new(user_id: current_user.id, vinyl_id: params[:vinyl_id], quantity: params[:quantity].to_i, :status "carted")

    @carted_product.save

    flash[:success] = 'Placed Into Cart'
    redirect_to "/carted_products"
  end

  def index

    @user_id = current_user.id
    @carted_products = CartedProduct.where(user_id: current_user.id AND status: "carted")
  end
end

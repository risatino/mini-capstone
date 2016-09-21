class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @carted_products = current_user.currently_carted
    @order = Order.create(user_id: current_user.id)
    @carted_products.update_all(order_id: @order.id, status: "purchased")
    @order.calculate_totals

    flash[:success] = 'Order Created!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
    redirect_to '/' if @order.user_id != current_user.id
  end
end

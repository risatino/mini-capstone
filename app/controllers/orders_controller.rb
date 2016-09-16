class OrdersController < ApplicationController
  
  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    calculated_subtotal = vinyl.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(user_id: current_user.id,
                          vinyl_id: params[:vinyl_id],
                          quantity: params[:quantity],
                          subtotal: calculated_subtotal,
                          tax: calculated_tax,
                          total: calculated_total)

    flash[:success] = 'Order Created!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end

end

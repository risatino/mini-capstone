class OrdersController < ApplicationController
  
  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    @order = Order.new(user_id: current_user.id,
                        vinyl_id: params[:vinyl_id],
                        quantity: params[:quantity].to_i)

    @order.calculate_subtotal(vinyl)
    @order.calculate_tax
    @order.calculate_total
    @order.save

    flash[:success] = 'Order Created!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
    @vinyl = @order.vinyl  
  end
end

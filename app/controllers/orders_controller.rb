class OrdersController < ApplicationController
  def create
    @vinyl = Vinyl.find(params[:id])
    @order = Order.create(user_id: params[:user_id],
                          quantity: params[:quantity],
                          vinyl_id: params[:vinyl_id])

    redirect_to "/orders/#{@order.id}"
    flash[:success] = 'Order Created!'
  end

  def show
    @order = Order.find(params[:id])
  end

end

class OrdersController < ApplicationController

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    authorize @order
  end

  def create
    item = Item.find(params[:item_id])
    box = Box.find(params[:box])
    order  = Order.create!(item_sku: item.sku, box: box, amount: item.price, state: 'pending', user: current_user)

    authorize order
    redirect_to new_order_payment_path(order)
  end

end

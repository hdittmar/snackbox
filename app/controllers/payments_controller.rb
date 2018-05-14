class PaymentsController < ApplicationController
  before_action :set_order

  def new
    authorize @order
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
      )

    charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents,
    description:  "Payment for item #{@order.item_sku} for order #{@order.id}",
    currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    send_text(@order)

    authorize @order
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end

  def send_text(order)
    driver = order.box.user
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"],ENV["TWILIO_AUTH_TOKEN"])
    @client.api.account.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: 'driver.phone_number',
      body: "Hey there! Your passenger bought 1 #{order.item_sku}"
    )
    p "sent"
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer: current_customer)
  end

  def index
    @order = Order.all
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    @order.order_status = "入金待ち"
    @order.total_price = (@cart_items.sum{|x| x.item.non_tax_price * x.product_amount} * 1.1).floor
    @order.shipping_price = 800
    @order.billing_amount = @order.total_price + @order.shipping_price
    if params[:order][:delivery_address] == "customer_address"
      @order.delivery_zip_code = current_customer.zip_code
      @order.delivery_address  = current_customer.address
      @order.delivery_name     = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address] == "delivery_address"
      # delivery = Delivery.find(params[:order][:delivery_id])
      @order.delivery_zip_code = delivery.zip_code
      @order.delivery_address  = delivery.address
      @order.delivery_name     = delivery.name
    elsif params[:order][:delivery_address] == "new_address"
      @order.delivery_zip_code = params[:order][:zip_code]
      @order.delivery_address  = params[:order][:address]
      @order.delivery_name     = params[:order][:name]
    end
  end

  def create
    # @order = current_customer.order.new(order_params)
    # どうにもcreateアクションにorderの中身が持ってこれない･･･
    @order = Order.new(order_params)
    @order.save

    # カートの商品を注文商品に移動する部分
    # 注文情報作成->カートを空っぽに->thanksへリダイレクト
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderItem.create
    end
    @cart_items.destroy_all
    # ここまで（作成中）

    redirect_to orders_thanks_path
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(
      :customer_id,    :delivery_zip_code, :delivery_address,
      :delivery_name,  :total_price,       :shipping_price,
      :billing_amount, :payment_method,    :order_status
    )
  end
end

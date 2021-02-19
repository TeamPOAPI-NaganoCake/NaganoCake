class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer: current_customer)
    # @total_price = (@cart_items.sum{|x| x.item.non_tax_price * x.product_amount} * 1.1).floor
  end

  def index
  end

  def show
  end

  def create
    @order = Order.new
    if params[:order][:delivery_address] == "customer_address"
      @order.delivery_zip_code = current_customer.zip_code
      @order.delivery_address  = current_customer.address
      @order.delivery_name     = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address] == "delivery_address"
      # 何故か動かない↓
      # delivery = Delivery.find(params[:order][:delivery_id])
      delivery = Delivery.find(2)
      @order.delivery_zip_code = delivery.zip_code
      @order.delivery_address  = delivery.address
      # 何故か動かない↓
      @order.name              = delivery.name
    end
    @order.save
    binding.pry
    redirect_to orders_confirm_path
  end

  def confirm
    @cart_items = current_customer.cart_items
  end

  def thanks
  end
end

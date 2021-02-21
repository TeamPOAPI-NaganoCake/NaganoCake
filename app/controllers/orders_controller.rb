class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer: current_customer)
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
      # delivery = Delivery.find(params[:order][:delivery_id])
      @order.delivery_zip_code = delivery.zip_code
      @order.delivery_address  = delivery.address
      @order.delivery_name              = delivery.name
    elsif params[:order][:delivery_address] == "new_address"
      @order.delivery_zip_code = params[:order][:zip_code]
      @order.delivery_address  = params[:order][:address]
      @order.delivery_name     = params[:order][:name]
    end
    @cart_items = current_customer.cart_items
    @order.total_price = (@cart_items.sum{|x| x.item.non_tax_price * x.product_amount} * 1.1).floor
    @order.customer_id = current_customer.id
    @order.save
    # binding.pry
    redirect_to orders_confirm_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.find_by(customer_id: current_customer.id)
    # binding.pry
  end

  def thanks
  end
end

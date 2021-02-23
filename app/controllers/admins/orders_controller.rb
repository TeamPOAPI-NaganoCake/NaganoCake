class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    session[:orders] = Order.find(params[:id]).customer.orders
  end

  def update
    order = Order.find(params[:id])
    # binding.pry
    order.update(order_status: params[:order_status].to_i)
    redirect_back(fallback_location: root_path)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to admins_homes_top_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :delivery_zip_code, :delivery_address, :delivery_name, :total_price, :shipping_price, :billing_amount, :payment_method, :order_status)
  end
# ここまで

end

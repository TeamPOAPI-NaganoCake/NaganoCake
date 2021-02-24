class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status == "入金確認"
      OrderItem.where(order_id: order.id).update_all(production_status: "制作待ち")
    end
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

end

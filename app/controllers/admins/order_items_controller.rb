class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    if order_item.order.order_items.count == order_item.order.order_items.where(production_status: "制作完了").count
      order_item.order.update(order_status: "発送準備中")
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end

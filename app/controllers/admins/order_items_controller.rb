class Admins::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(production_status: params[:production_status].to_i)
    redirect_back(fallback_location: root_path)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end

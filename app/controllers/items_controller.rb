class ItemsController < ApplicationController
  def index
    @item_all = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    # 不要かもしれない↓
    @cart_item = CartItem.new()
  end

end

class ItemsController < ApplicationController
  def index
    @item_all = Item.all
    @items = Item.page(params[:page]).per(8)

# 商品登録がしづらいので、作成。後々消します。
    @item = Item.new()
# ここまで
  end

# 商品登録がしづらいので、作成。後々消します。
  # def create
  #   item = Item.new(item_params)
  #   item.save
  #   redirect_back(fallback_location: :top)
  # end
# ここまで


  def show
    @item = Item.find(params[:id])
    # 不要かもしれない↓
    @cart_item = CartItem.new()
  end

# admin未作成のため、商品登録用。後々消します。
  private
  def item_params
    params.require(:item).permit(:name, :caption, :non_tax_price, :sale_status)
  end
# ここまで

end

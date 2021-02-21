class ItemsController < ApplicationController
  def index
    @genres = Genre.all

    @items = Item.page(params[:page]).per(8)

    if params[:genre_id]
      # ジャンルIDが一致する商品を取得
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
      @info = "#{@genre.genre_name}"
    else
      # 全商品を取得
      @items = Item.page(params[:page]).per(8)
      @info = "商品"
    end
    @item_all = @items.total_count
  end



# 商品登録がしづらいので、作成。後々消します。
  def create
    item = Item.new(item_params)
    item.save
    redirect_back(fallback_location: :top)
  end
# ここまで


  def show
    @genres = Genre.all
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

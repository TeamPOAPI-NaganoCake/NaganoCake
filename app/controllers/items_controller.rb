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


  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    # 不要かもしれない↓
    @cart_item = CartItem.new()
  end

end

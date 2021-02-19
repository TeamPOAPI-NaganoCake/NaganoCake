class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admins_item_path(item)
  end

  def edit
  end

  def new
    @item = Item.new()
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  # def item_params
  #   params.require(:item).permit(:name, :image, :caption, :non_tax_price, :genre, :sale_status)
  # end
  def item_params
    params.require(:item).permit(:name, :image, :caption, :genre_id, :non_tax_price, :sale_status)
  end
end

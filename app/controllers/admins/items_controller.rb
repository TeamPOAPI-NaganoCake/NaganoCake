class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admins_customers_show_path
  end

  def edit
  end

  def new
    @item = Item.new()
  end

  def show
  end

  private

  # def item_params
  #   params.require(:item).permit(:name, :image, :caption, :non_tax_price, :genre, :sale_status)
  # end
  def item_params
    params.require(:item).permit(:name, :image, :caption, :non_tax_price, :sale_status)
  end
end

class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new()
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admins_item_path(item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      render :update
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :caption, :genre_id, :non_tax_price, :sale_status)
  end
end

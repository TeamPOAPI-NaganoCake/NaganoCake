class Admins::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def show
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admins_item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品内容をを変更しました"
      redirect_to admins_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :caption, :genre_id, :non_tax_price, :sale_status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
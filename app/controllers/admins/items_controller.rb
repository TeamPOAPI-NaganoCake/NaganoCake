class Admins::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
    @items = Item.page(params[:page])
  end

  def create
    item = Item.new(item_params)
    item.save
    flash[:notice] = "新商品を登録しました"
    redirect_to admins_customers_show_path
  end

  def edit
  end

  def new
    @item = Item.new()
  end

  def show
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

  # def item_params
  #   params.require(:item).permit(:name, :image, :caption, :non_tax_price, :genre, :sale_status)
  # end
  def item_params
    params.require(:item).permit(:name, :image, :caption, :non_tax_price, :sale_status)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
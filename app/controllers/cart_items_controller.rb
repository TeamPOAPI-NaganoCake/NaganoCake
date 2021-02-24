class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: [:create, :update, :update, :destroy]

  def index
    @cart_items = current_customer.cart_items
    @numbers = (1..100).to_a
  end

  def create
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
      @cart_item.product_amount = params[:product_amount].to_i
    else
      @cart_item.product_amount += params[:product_amount].to_i
    end
    if @cart_item.save
      flash[:success] = 'カートに商品が追加されました！'
      redirect_to cart_items_path
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "数量を選択してください"
    end
  end

  def update
    @cart_item.update(product_amount: params[:product_amount].to_i)
    flash[:success] = "#{@cart_item.item.name}の数量を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item.destroy
    flash[:danger] = "#{@cart_item.item.name}を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
    flash[:info] = 'カートを空にしました。'
  end

  private

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

end

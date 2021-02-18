class CartItemsController < ApplicationController

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
      redirect_to cart_items_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "数量を選択してください"
    end
  end

  def update
    @cart_item.update(product_amount: params[:product_amount].to_i)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

end

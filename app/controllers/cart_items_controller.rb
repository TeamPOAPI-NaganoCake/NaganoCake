class CartItemsController < ApplicationController

  before_action :setup_cart_item!, only: [:create, :update, :update, :destroy, :destroy_all]

  def index
    @cart_items = current_customer.cart_items
    @numbers = (1..30).to_a
  end

  def create
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
      @cart_item.product_amount = params[:product_amount]
    end
      @cart_item.product_amount += params[:product_amount].to_i
      @cart_item.save
      redirect_to cart_items_path
  end

  def update
    @cart_item.update(product_amount: params[:product_amount].to_i)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
    current_customer.cart_items.destroy
    redirect_to cart_items_path
  end

  private

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

end

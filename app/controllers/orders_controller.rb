class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer: current_customer)
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(5)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items                     # カートアイテム呼び出し
    @order.customer_id = current_customer.id                      # customer.idを入れる
    @order.payment_method = params[:order][:payment_method]       # 支配方法を入れる
    @order.order_status = "入金待ち"                              # 決済ステータス設定
    @order.total_price = (@cart_items.sum{|x| x.item.non_tax_price * x.product_amount} * 1.1).floor # 購入金額
    @order.shipping_price = 800                                   # 送料
    @order.billing_amount = @order.total_price + @order.shipping_price # 購入金額 + 送料
    # 選択したお届け先によるif分岐
    if params[:order][:delivery_address] == "customer_address"    # customerの登録住所へ送付
      @order.delivery_zip_code = current_customer.zip_code
      @order.delivery_address  = current_customer.address
      @order.delivery_name     = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_address] == "delivery_address" # 配送先住所へ送付
      delivery = Delivery.find(params[:order][:delivery])
      @order.delivery_zip_code = delivery.zip_code
      @order.delivery_address  = delivery.address
      @order.delivery_name     = delivery.name
    elsif params[:order][:delivery_address] == "new_address"      # 新しい住所へ送付
      @delivery = Delivery.new
      @order.delivery_zip_code = params[:order][:zip_code]
      @order.delivery_address  = params[:order][:address]
      @order.delivery_name     = params[:order][:name]
      # 住所の保存
      @delivery.customer_id = current_customer.id
      @delivery.zip_code = @order.delivery_zip_code
      @delivery.address = @order.delivery_address
      @delivery.name = @order.delivery_name
      @delivery.save
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    # OrderItemにCartItemの中身を保存
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.item_id = cart_item.item.id
      @order_items.purchase_price = cart_item.item.non_tax_price
      @order_items.amount = cart_item.product_amount
      @order_items.save
    end
    @cart_items.destroy_all    # カートの中身を全削除
    redirect_to orders_thanks_path
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(
      :customer_id,    :delivery_zip_code, :delivery_address,
      :delivery_name,  :total_price,       :shipping_price,
      :billing_amount, :payment_method,    :order_status
    )
  end
  def delivery_params
    params.require(:order).permit(:zip_code, :address, :name)
  end
end

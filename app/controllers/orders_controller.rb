class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @deliveries = Delivery.where(customer: current_customer)
  end

  def index
    # @orders = Order.where(id: current_customer.id)
    @orders = current_customer.orders
    # @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    # @order = Order.new(
    #   customer: current_customer,
    # )
    @cart_items = current_customer.cart_items                 # カートアイテム呼び出し
    @order.customer_id = current_customer.id                  # customer.idを入れる
    @order.payment_method = params[:order][:payment_method]   # 支配方法を入れる
    @order.order_status = "入金待ち"                          # 決済ステータス設定
    @order.total_price = (@cart_items.sum{|x| x.item.non_tax_price * x.product_amount} * 1.1).floor # 購入金額
    @order.shipping_price = 800                               # 送料
    @order.billing_amount = @order.total_price + @order.shipping_price # 購入金額 + 送料
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
      @order.delivery_zip_code = params[:order][:zip_code]
      @order.delivery_address  = params[:order][:address]
      @order.delivery_name     = params[:order][:name]
      @deliver = "1"
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    # @order = Order.new(order_params)
    @order.save
    # カートの商品を注文商品に移動する部分
    # 注文情報作成->カートを空っぽに->thanksへリダイレクト
    @cart_items = current_customer.cart_items
    # @cart_items.each do |cart_item|
    #   OrderItem.create(
    #     item: cart_item.item,
    #     order: @order,
    #     amount: cart_item.product_amount
    #     purchase_price: non_tax_price(cart_item)
    #   )
    # end
    # 新しい配送先で注文された場合に保存する（作成中）
    
    binding.pry
    
    if params[:order][:deliver] == "1"
      current_customer.delivery.create(delivery_params)
    end
    @cart_items.destroy_all    # カートの中身を全削除
    # ここまで（作成中）

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
    params.require(:order).permit(:delivery_zip_code, :delivery_address, :delivery_name)
  end
end

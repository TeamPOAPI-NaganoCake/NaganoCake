class OrdersController < ApplicationController
  # include ApplicationHelper
  # before_action :to_log, only: [:show]
  # ログイン済みユーザーのみアクセスを許可
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @delivery = Delivery.new
    @deliveries = Delivery.where(customer: current_customer)
    # 自分の登録住所を呼び出し
    @customers = Customer.find(current_customer.id)
    # 登録配送先を呼び出し
    # @deliveries = Delivery.find(params[:id])
  end

  def index
    @orders = Order.find(current_customer.id)
  end

  def show
    # @order = Order.find(params[:id])
    # @order_product = @order.order_product
  end

  def log
    @cart_items = current_cart
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )
    # 請求総額をここで入力
    @order.billing_amount = billing(@order)
    # 送り先＝登録住所の場合
    if params[:order][:addresses] == "address"
      @order.delivery_zip_code = current_customer.zip_code  # テーブル定義書ではlean
      @order.delivery_address  = current_customer.address
      @order.name              = current_customer.last_name +
                                 current_customer.first_name
    # 送り先＝配送先住所の場合
    elsif params[:order][:addresses] == "delivery_addresses"
      delivery = Delivery_address.find(params[:order][:delivery_id])
      @order.delivery_zip_code = params[:order][:zip_code]
      @order.delivery_address  = params[:order][:address]
      @order.name              = params[:order][:name]
      # ここの記述内容を確認中...
      # @ship = "1"
      # バリデーションのエラー出力部
      unless @order.valid? == true
        @delivery_address = Delivery_address.where(customer: current_customer)
        render :new
      end
    end
  end

  def create
    @order = current_customer.orders.new(order_product)
    @order.save
    # どっちか
    # redirect_to thanks_customers_orders_path
    redirect_to orders_thanks
    @cart_items = current_cart
    @cart_items.each do |cart_item|
      OrderProduct.create(
        # この辺は全部修正予定
        product: cart_item.product,
        order: @order,
        quantity: cart_item.quantity,
        subprice: sub_price(cart_item)
        # ここまで
      )
    end
    @cart_items.destroy_all
  end

  def confirm
  end

  def thanks
    
  end

  private
  def order_params
    params.require(:order).permit(:zip_code, :address, :name, :payment_method, :billing_amount)
  end
  def address_params
    params.require(:order).permit(:zipbode, :address, :name)
  end
  def to_log
    redirect_to customers_cart_items_path if params[:id] == "log"
  end
end

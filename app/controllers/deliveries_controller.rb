class DeliveriesController < ApplicationController
  before_action :set_delivery, only:[:edit, :update, :destroy]
  before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.where(customer_id: current_customer.id).page(params[:page]).per(3)
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:success] = '新しい配送先が追加されました！'
      redirect_to deliveries_path
    else
      @deliveries = Delivery.where(customer_id: current_customer.id).page(params[:page]).per(3)
      render action: :index
    end
  end

  def edit
    if @delivery.customer_id == current_customer.id
      render "edit"
    else
      redirect_to deliveries_path
    end
  end

  def update
    @delivery.update(delivery_params)
    flash[:success] = '配送先情報が更新されました！'
    redirect_to deliveries_path
  end

  def destroy
    @delivery.destroy
    flash[:danger] = '配送先を削除しました！'
    redirect_to deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:zip_code, :address, :name)
  end

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
end

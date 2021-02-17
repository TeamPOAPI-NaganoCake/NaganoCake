class DeliveriesController < ApplicationController
  before_action :set_delivery, only:[:edit, :update, :destroy]


  def index
    @delivery = Delivery.new
    @deliveries = Delivery.where(customer_id: current_customer.id)
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path
    else
      @deliveries = Delivery.where(customer_id: current_customer.id)
      render action: :index
    end
  end

  def edit
    if @delivery.customer.id = current_customer.id
      render "edit"
    else
      redirect_to deliveries_path
    end
  end

  def update
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery.destroy
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

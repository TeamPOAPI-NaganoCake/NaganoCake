class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update]
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end
  
  def update
    if @customer.update(customer_params)
      flash[:success] = "会員内容をを変更しました"
       redirect_to admins_customers_path
    else
      render "edit"
    end
  end
  
  private
  
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                       :zip_code, :address, :phone_number, :cancel_flag)
  end
end

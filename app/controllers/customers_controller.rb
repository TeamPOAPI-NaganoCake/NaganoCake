class CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :set_customer


  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = 'お客様情報が更新されました！'
      redirect_to customers_path
    else
      flash[:danger] = 'お客様の情報を更新出来ませんでした。内容をご確認ください。'
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrew
    customer = current_customer
    customer.update(cancel_flag: false)
    reset_session
    flash[:info] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to root_path 
    
  end
  
  private

  
  
  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                       :zip_code, :address, :phone_number)
  end
  
  
end

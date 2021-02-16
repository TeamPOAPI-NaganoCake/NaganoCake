class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end

  def unsubscribe
     @customer = Customer.find(params[:id])
  end

  def withdrew
    @customer = Customer.find(params[:id])
    @customer.update(cancel_flag: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                       :zip_code, :address, :phone_number)
  end
end

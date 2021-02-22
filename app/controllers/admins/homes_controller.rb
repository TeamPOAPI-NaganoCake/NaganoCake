class Admins::HomesController < ApplicationController
  def top
    # うまくいかないのでいったんコメントアウトしてます。
    # if session[:orders]
    #   @orders = session[:orders].page(params[:page]).per(10)
    # else
    #   @orders = Order.page(params[:page]).per(10)
    # end
# 仮
    @orders = Order.page(params[:page]).per(10)
    @order = Order.new
  end
end

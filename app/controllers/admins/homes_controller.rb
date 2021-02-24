class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    # 前ページのデータを引くための記述
    path = Rails.application.routes.recognize_path(request.referer)

    # 転移元のリンクに引数を渡すことで、どのリンクから飛んだか条件分岐している
    if params[:order_sort] == "0"
      @orders = Order.where(customer_id: path[:id]).page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end
end

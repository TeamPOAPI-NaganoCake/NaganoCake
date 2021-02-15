class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_zipcode
      t.integer :delivery_address
      t.string :delivery_name
      t.integer :shipping_price, default: 800  # 送料
      t.integer :billing_amount, default: 0    # 請求額
      t.integer :payment_method, defalut: 0    # 支払方法
      t.integer :order_status    # 注文状況status

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.string :delivery_zip_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :total_price
      t.integer :shipping_price # 送料
      t.integer :billing_amount # 総額
      t.integer :payment_method # 支払い方法
      t.integer :order_status   # 注文ステータス

      t.timestamps
    end
  end
end

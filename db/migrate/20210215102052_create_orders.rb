class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.string :delivery_zip_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :total_price
      t.integer :shipping_price
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end

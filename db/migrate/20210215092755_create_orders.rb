class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_zipcode
      t.integer :delivery_address
      t.string :delivery_name
      t.integer :shipping_price
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end

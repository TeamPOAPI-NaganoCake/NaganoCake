class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.string :zip_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end

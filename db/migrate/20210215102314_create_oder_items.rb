class CreateOderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :purchase_price
      t.integer :amount
      t.integer :production_status

      t.timestamps
    end
  end
end

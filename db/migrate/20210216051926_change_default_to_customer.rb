class ChangeDefaultToCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :cancel_flag, from: nil, to: true
  end
end

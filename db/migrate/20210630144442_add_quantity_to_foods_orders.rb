class AddQuantityToFoodsOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :foods_orders, :quantity, :integer, null: false
  end
end

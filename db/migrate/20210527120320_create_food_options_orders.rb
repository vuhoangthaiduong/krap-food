class CreateFoodOptionsOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :food_options_orders do |t|
      t.references :food_option
      t.references :order
      t.decimal :original_price
      t.integer :amount

      t.timestamps
    end
    add_foreign_key :food_options_orders, :food_options
    add_foreign_key :food_options_orders, :orders
  end
end

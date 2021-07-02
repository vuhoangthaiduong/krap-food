class RemoveFoodOptions < ActiveRecord::Migration[6.1]
  def change
    drop_table :food_options_orders
    drop_table :food_options
  end
end

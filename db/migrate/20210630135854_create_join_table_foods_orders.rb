class CreateJoinTableFoodsOrders < ActiveRecord::Migration[6.1]
  def change
    create_join_table :foods, :orders do |t|
      # t.index [:food_id, :order_id]
      # t.index [:order_id, :food_id]
    end
  end
end

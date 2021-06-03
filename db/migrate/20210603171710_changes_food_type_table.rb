class ChangesFoodTypeTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :food_types, :food_categories
  end
end

class CreateFoodGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :food_groups do |t|
      t.string :name
      t.text :description
      t.references :restaurant
      t.timestamps
    end
    add_foreign_key :food_groups, :restaurants
    
  end
end

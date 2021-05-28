class CreateFoodOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :food_options do |t|
      t.string :name
      t.references :food
      t.string :group_name
      t.integer :availability

      t.timestamps
    end
    add_foreign_key :food_options, :foods
  end
end

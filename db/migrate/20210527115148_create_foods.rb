class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.references :restaurant
      t.decimal :price
      t.integer :food_type
      t.integer :type_id
      t.integer :promo_id

      t.timestamps
    end
    add_foreign_key :foods, :restaurants
  end
end

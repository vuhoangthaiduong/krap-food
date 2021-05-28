class CreatePromos < ActiveRecord::Migration[6.1]
  def change
    create_table :promos do |t|
      t.string :name
      t.references :restaurant
      t.integer :discount_type
      t.decimal :condition_amount
      t.decimal :discount_amount
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
    add_foreign_key :promos, :restaurants
    add_index :promos, :name
  end
end

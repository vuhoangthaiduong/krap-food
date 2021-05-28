class CreateRestaurantsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants_users do |t|
      t.references :customer
      t.integer :restaurant_id
      t.integer :is_favourited

      t.timestamps
    end

    add_foreign_key :restaurants_users, :users, column: :customer_id
    
  end
end

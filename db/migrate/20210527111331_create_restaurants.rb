class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.references :owner
      t.integer :status
      t.decimal :balance
      t.string :address
      t.datetime :open_at
      t.datetime :close_at
      
      t.timestamps
    end

    add_foreign_key :restaurants, :users, column: :owner_id
    add_index :restaurants, :name
    
  end
end

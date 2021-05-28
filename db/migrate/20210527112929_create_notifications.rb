class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :restaurant
      t.references :customer
      t.references :driver
      t.integer :notification_type
      t.string :description
      t.text :content
      t.boolean :is_read

      t.timestamps
    end

    add_foreign_key :notifications, :restaurants
    add_foreign_key :notifications, :users, column: :customer_id
    add_foreign_key :notifications, :users, column: :driver_id

  end
end

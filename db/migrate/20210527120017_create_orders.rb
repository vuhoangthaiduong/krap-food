class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer
      t.references :driver
      t.string :note_to_driver
      t.integer :status
      t.datetime :driver_accepted_at
      t.datetime :driver_arrived_at
      t.datetime :driver_started_delivering_at
      t.datetime :driver_finished_delivering_at
      t.datetime :driver_cancelled_at
      t.integer :paid_by
      t.datetime :paid_at
      t.datetime :cancelled_at
      t.integer :promo_id
      t.integer :voucher_id
      t.decimal :shipping_fee

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :customer_id
    add_foreign_key :orders, :users, column: :driver_id
  end
end

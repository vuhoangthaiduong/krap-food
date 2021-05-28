class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers do |t|
      t.text :name
      t.references :restaurant
      t.integer :discount_type
      t.integer :apply_condition
      t.decimal :coindition_amount
      t.decimal :discount_amount
      t.datetime :valid_from
      t.datetime :valid_to
      t.decimal :maximum_amount

      t.timestamps
    end
    add_foreign_key :vouchers, :restaurants
  end
end

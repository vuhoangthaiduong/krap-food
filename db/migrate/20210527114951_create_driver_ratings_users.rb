class CreateDriverRatingsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :driver_ratings_users do |t|
      t.references :customer
      t.references :driver
      t.integer :star_review
      t.text :text_review

      t.timestamps
    end
    add_foreign_key :driver_ratings_users, :users, column: :customer_id
    add_foreign_key :driver_ratings_users, :users, column: :driver_id
  end
end

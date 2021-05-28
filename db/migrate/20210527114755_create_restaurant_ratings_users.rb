class CreateRestaurantRatingsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_ratings_users do |t|
      t.references :customer
      t.references :restaurant
      t.integer :star_review
      t.text :text_review

      t.timestamps
    end
    add_foreign_key :restaurant_ratings_users, :users, column: :customer_id
    add_foreign_key :restaurant_ratings_users, :restaurants
  end
end

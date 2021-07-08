class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :restaurant
      t.references :user
      t.text :content
      
      t.timestamps
    end
    add_foreign_key :reviews, :restaurants
    add_foreign_key :reviews, :users
  end
end

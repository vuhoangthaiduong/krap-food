class ChangeDateTimeToTimeInRestaurants < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :open_at, :time
    change_column :restaurants, :close_at, :time
  end
end

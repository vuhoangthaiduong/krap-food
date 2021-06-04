class AddAvailibilityToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :availability, :int
  end
end

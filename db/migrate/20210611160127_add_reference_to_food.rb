class AddReferenceToFood < ActiveRecord::Migration[6.1]
  def change
    add_reference :foods, :group, index: true
    add_foreign_key :foods, :food_groups, column: :group_id
  end
end

class ChangesFoodsTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :foods, :type_id, :category_id
    remove_column :foods, :food_type, :integer
    add_column :foods, :details, :text
  end
end

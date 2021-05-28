class CreateRolesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :roles_users do |t|
      t.references :user
      t.references :role
      t.decimal :balance

      t.timestamps
    end
    add_foreign_key :roles_users, :users
    add_foreign_key :roles_users, :roles
  end
end

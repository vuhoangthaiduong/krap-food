class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :int
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :user_type, :int
    add_column :users, :suspended_at, :datetime
    add_column :users, :terminated_at, :datetime
  end
end

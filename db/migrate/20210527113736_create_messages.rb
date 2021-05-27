class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :sender
      t.text :body
      t.datetime :seen_at
      t.datetime :send_at
      t.references :conversation
      t.integer :reaction_type

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :conversations
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_27_120320) do

  create_table "conversations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "driver_ratings_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.integer "star_review"
    t.text "text_review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_driver_ratings_users_on_customer_id"
    t.index ["driver_id"], name: "index_driver_ratings_users_on_driver_id"
  end

  create_table "food_options", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "food_id"
    t.string "group_name"
    t.integer "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_food_options_on_food_id"
  end

  create_table "food_options_orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "food_option_id"
    t.bigint "order_id"
    t.decimal "original_price", precision: 10
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_option_id"], name: "index_food_options_orders_on_food_option_id"
    t.index ["order_id"], name: "index_food_options_orders_on_order_id"
  end

  create_table "food_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id"
    t.decimal "price", precision: 10
    t.integer "food_type"
    t.integer "type_id"
    t.integer "promo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "sender_id"
    t.text "body"
    t.datetime "seen_at"
    t.datetime "send_at"
    t.bigint "conversation_id"
    t.integer "reaction_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.integer "notification_type"
    t.string "description"
    t.text "content"
    t.boolean "is_read"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
    t.index ["driver_id"], name: "index_notifications_on_driver_id"
    t.index ["restaurant_id"], name: "index_notifications_on_restaurant_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.string "note_to_driver"
    t.integer "status"
    t.datetime "driver_accepted_at"
    t.datetime "driver_arrived_at"
    t.datetime "driver_started_delivering_at"
    t.datetime "driver_finished_delivering_at"
    t.datetime "driver_cancelled_at"
    t.integer "paid_by"
    t.datetime "paid_at"
    t.datetime "cancelled_at"
    t.integer "promo_id"
    t.integer "voucher_id"
    t.decimal "shipping_fee", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["driver_id"], name: "index_orders_on_driver_id"
  end

  create_table "promos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id"
    t.integer "discount_type"
    t.decimal "condition_amount", precision: 10
    t.decimal "discount_amount", precision: 10
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_promos_on_name"
    t.index ["restaurant_id"], name: "index_promos_on_restaurant_id"
  end

  create_table "restaurant_ratings_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "restaurant_id"
    t.integer "star_review"
    t.text "text_review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_restaurant_ratings_users_on_customer_id"
    t.index ["restaurant_id"], name: "index_restaurant_ratings_users_on_restaurant_id"
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.integer "status"
    t.decimal "balance", precision: 10
    t.string "address"
    t.datetime "open_at"
    t.datetime "close_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_restaurants_on_name"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
  end

  create_table "restaurants_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "restaurant_id"
    t.integer "is_favourited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_restaurants_users_on_customer_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.decimal "balance", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "gender"
    t.string "phone_number"
    t.string "address"
    t.integer "user_type"
    t.datetime "suspended_at"
    t.datetime "terminated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "name"
    t.bigint "restaurant_id"
    t.integer "discount_type"
    t.integer "apply_condition"
    t.decimal "coindition_amount", precision: 10
    t.decimal "discount_amount", precision: 10
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.decimal "maximum_amount", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_vouchers_on_restaurant_id"
  end

  add_foreign_key "conversations", "users", column: "recipient_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "driver_ratings_users", "users", column: "customer_id"
  add_foreign_key "driver_ratings_users", "users", column: "driver_id"
  add_foreign_key "food_options", "foods"
  add_foreign_key "food_options_orders", "food_options"
  add_foreign_key "food_options_orders", "orders"
  add_foreign_key "foods", "restaurants"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "notifications", "restaurants"
  add_foreign_key "notifications", "users", column: "customer_id"
  add_foreign_key "notifications", "users", column: "driver_id"
  add_foreign_key "orders", "users", column: "customer_id"
  add_foreign_key "orders", "users", column: "driver_id"
  add_foreign_key "promos", "restaurants"
  add_foreign_key "restaurant_ratings_users", "restaurants"
  add_foreign_key "restaurant_ratings_users", "users", column: "customer_id"
  add_foreign_key "restaurants", "users", column: "owner_id"
  add_foreign_key "restaurants_users", "users", column: "customer_id"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "vouchers", "restaurants"
end

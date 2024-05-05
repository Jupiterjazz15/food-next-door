Item.delete_all
Category.delete_all
User.delete_all

user1 = User.create!(first_name: "Clothile", last_name: "Sache", phone: "00-00-00-00-00", email: "clothilde@test.com", password: "azerty", neighbourhood_type: "Building" )
p "User #{user1.first_name} has been created"

user2 = User.create!(first_name: "Coralie", last_name: "Haller", phone: "00-00-00-00-00", email: "coralie@test.com", password: "azerty", neighbourhood_type: "Residential Street")
p "User #{user2.first_name} has been created"

category_food = Category.creat!(name: "Food", parent_id: nil)
p "Category #{category_food.name} has been created"

category_home = Category.creat!(name: "Home", parent_id: nil)
p "Category #{category_home.name} has been created"


create_table "categories", force: :cascade do |t|
  t.string "name"
  t.integer "parent_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

item1 = Item.create!(user: User.first, category: Category.find_by(name: "Clothes"), title: "T-shirt", description: "White t-shirt, size M", quantity_unit: "piece", quantity_value: 1, available_start_date: "2024-05-05 14:31:12", available_end_date: "2024-05-05 14:31:12", best_before_date: "2024-05-05 14:31:12", item_address: "5 rue de la paix, Paris", food_condition: "Good", home_condition: "Good", is_available: true)


create_table "items", force: :cascade do |t|
  t.bigint "user_id", null: false
  t.bigint "category_id", null: false
  t.string "title"
  t.text "description"
  t.string "quantity_unit"
  t.decimal "quantity_value"
  t.datetime "available_start_date"
  t.datetime "available_end_date"
  t.datetime "best_before_date"
  t.string "item_address"
  t.string "food_condition"
  t.string "home_condition"
  t.boolean "is_available", default: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["category_id"], name: "index_items_on_category_id"
  t.index ["user_id"], name: "index_items_on_user_id"
end

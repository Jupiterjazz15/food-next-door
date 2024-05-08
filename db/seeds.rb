Item.delete_all
Category.delete_all
User.delete_all
Building.delete_all

### Création de deux buildings ###
building1 = Building.create!(name: "Bâtiment rue Servan", description: "Un bâtiment à la décoration sobre où vivent des individus sympathiques et engagés.", building_address:"61 Rue Servan, 75011 Paris",)
p "Building #{building1.name} has been created"

building2 = Building.create!(name:"Bâtiment Vila Gaudelet", description: "Un bâtiment chaleureux et convivial où il fait bon vivre.", building_address: "16 Vila Gaudelet, 75011 Paris",)
p "Building #{building2.name} has been created"

### Création de deux users ###
user1 = User.create!(first_name: "Clothile", last_name: "Scache", birthday:"18/07/1996", phone: "00-00-00-00-00", user_address:"61 Rue Servan, 75011 Paris", email: "clothilde@test.com", password: "azerty", is_ambassador:  true, want_to_be_ambassador: true, building_id: building1.id)
p "User #{user1.first_name} has been created"

user2 = User.create!(first_name: "Coralie", last_name: "Haller",birthday:"15/08/1994", phone: "00-00-00-00-00", user_address: "16 Vila Gaudelet, 75011 Paris", email: "coralie@test.com", password: "azerty", is_ambassador: false, want_to_be_ambassador: false, building_id: building2.id)
p "User #{user2.first_name} has been created"

### Catégorie FOOD et ses sous catégories ###
category_food = Category.create!(name: "Food", parent_id: nil)
p " CATEGORY #{category_food.name.upcase} HAS BEEN CREATED"

category1 = Category.create!(name: "Baby", parent_id: category_food.id)
p "Category #{category1.name} that belongs to the category #{category_food.name} has been created"

item1 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Baby").id, title: "Stewed", description: "Taste : apple ", quantity_unit: "Unit", quantity_value: 6, available_start_date: "2024-05-21 14:30", available_end_date: "2024-05-25 14:30", best_before_date: "2024-05-29", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item1.title} has been created and belong to User with the id #{item1.user_id}"

category2 = Category.create!(name: "Bakery", parent_id: category_food.id)
p "Category #{category2.name} that belongs to the category #{category_food.name} has been created"

item2 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Bakery").id, title: "Croissant", description: "A pack of 3 croissants", quantity_unit: "Unit", quantity_value: 3, available_start_date: "2024-05-15 09:00", available_end_date: "2024-05-17 19:00", best_before_date: "2024-05-18", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Opened", home_condition: nil, is_available: true)
p "Item #{item2.title} has been created and belong to User with the id #{item2.user_id}"

category3 = Category.create!(name: "Desserts", parent_id: category_food.id)
p "Category #{category3.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item3 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Desserts").id, title: "Cake", description: "A homemade chocolate cake", quantity_unit: "Gram", quantity_value: 500 , available_start_date: "2024-05-17 10:00", available_end_date: "2024-05-18 20:00", best_before_date: "2024-05-19", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Cooked", home_condition: nil, is_available: true)
p "Item #{item3.title} has been created and belong to User with the id #{item3.user_id}"

category4 = Category.create!(name: "Drinks", parent_id: category_food.id)
p "Category #{category4.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item4 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Drinks").id, title: "Cake", description: "A homemade kombucha", quantity_unit: "mL", quantity_value: 500 , available_start_date: "2024-05-20 10:00", available_end_date: "2024-05-21 18:00", best_before_date: "2024-05-27", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Cooked", home_condition: nil, is_available: true)
p "Item #{item4.title} has been created and belong to User with the id #{item4.user_id}"

category5 = Category.create!(name: "Fresh", parent_id: category_food.id)
p "Category #{category5.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item5 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Fresh").id, title: "Soja yogurt", description: "A blueberry soja yogurt", quantity_unit: "Gram", quantity_value: 400 , available_start_date: "2024-05-17 10:00", available_end_date: "2024-05-21 18:00", best_before_date: "2024-06-01", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item5.title} has been created and belong to User with the id #{item5.user_id}"

category6 = Category.create!(name: "Frozen", parent_id: category_food.id)
p "Category #{category6.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item6 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Frozen").id, title: "Spinach", description: "A small bag of spinach leaves in portions", quantity_unit: "Gram", quantity_value: 2500 , available_start_date: "2024-05-15 12:00", available_end_date: "2024-05-30 18:00", best_before_date: "2024-07-01", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item6.title} has been created and belong to User with the id #{item6.user_id}"

category7 = Category.create!(name: "Pantry", parent_id: category_food.id)
p "Category #{category7.name} that belongs to the category #{category_food.name} has been created"

item7 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Pantry").id, title: "Can of chickpeas", description: "2 cans", quantity_unit: "Unit", quantity_value: 2 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-05-30 18:00", best_before_date: "2024-07-01", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item7.title} has been created and belong to User with the id #{item7.user_id}"

category8 = Category.create!(name: "Pet", parent_id: category_food.id)
p "Category #{category8.name} that belongs to the category #{category_food.name} has been created"

item8 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Pet").id, title: "Pâté for puppy", description: "3 cans", quantity_unit: "Unit", quantity_value: 3 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-05-20 19:00", best_before_date: "2024-07-10", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item8.title} has been created and belong to User with the id #{item8.user_id}"

category9 = Category.create!(name: "Other", parent_id: category_food.id)
p "Category #{category9.name} that belongs to the category #{category_food.name} has been created"

item9 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Other").id, title: "Lollipop", description: "Half a sachet", quantity_unit: "Unit", quantity_value: 10 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-07-01 19:00", best_before_date: "2024-12-31", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true)
p "Item #{item9.title} has been created and belong to User with the id #{item9.user_id}"

### Catégorie HOME et ses sous catégories ###

category_home = Category.create!(name: "Home", parent_id: nil)
p "CATEGORY #{category_home.name.upcase} HAS BEEN CREATED"

category10 = Category.create!(name: "Furniture", parent_id: category_home.id)
p "Category #{category10.name} that belongs to the category #{category_home.name} has been created"

item10 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Furniture").id, title: "Table", description: "A wooden table", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-05 14:30", available_end_date: "2024-05-05 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Like new", is_available: true)
p "Item #{item10.title} has been created and belong to User with the id #{item10.user_id}"

category11 = Category.create!(name: "Household", parent_id: category_home.id)
p "Category #{category11.name} that belongs to the category #{category_home.name} has been created"

item11 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Household").id, title: "Hoover", description: "Bought 2 years ago and it works perfectly!", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-19 18:30", available_end_date: "2024-05-26 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Used - good", is_available: true)
p "Item #{item11.title} has been created and belong to User with the id #{item11.user_id}"

category12 = Category.create!(name: "Make up", parent_id: category_home.id)
p "Category #{category12.name} that belongs to the category #{category_home.name} has been created"

item12 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Make up").id, title: "Lipstick", description: "A coral lipstick", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-06-01 14:30", available_end_date: "2024-06-29 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Like new", is_available: true)
p "Item #{item12.title} has been created and belong to User with the id #{item12.user_id}"

category13 = Category.create!(name: "Toiletries", parent_id: category_home.id)
p "Category #{category13.name} that belongs to the category #{category_home.name} has been created"

item13 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Toiletries").id, title: "Perfume", description: "Chanel n°5", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-10 17:00", available_end_date: "2024-12-31 18:00", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: nil, home_condition: "Open - used", is_available: true)
p "Item #{item13.title} has been created and belong to User with the id #{item13.user_id}"

category14 = Category.create!(name: "Other", parent_id: category_home.id)
p "Category #{category14.name} that belongs to the category #{category_home.name} has been created"

item14 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Other").id, title: "DVD The Leftovers", description: "All the DVDs of the series are in this DVD box set", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-07-05 12:00", available_end_date: "2024-07-15 12:00", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: nil, home_condition: "Used - good", is_available: true)
p "Item #{item14.title} has been created and belong to User with the id #{item14.user_id}"

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
user1 = User.create!(first_name: "Clothilde", last_name: "Scache", birthday:"18/07/1996", phone: "00-00-00-00-00", user_address:"61 Rue Servan, 75011 Paris", email: "clothilde@test.com", password: "azerty", is_ambassador:  true, want_to_be_ambassador: true, building_id: building1.id)
p "User #{user1.first_name} has been created"

user2 = User.create!(first_name: "Coralie", last_name: "Haller",birthday:"15/08/1994", phone: "00-00-00-00-00", user_address: "16 Vila Gaudelet, 75011 Paris", email: "coralie@test.com", password: "azerty", is_ambassador: false, want_to_be_ambassador: false, building_id: building2.id)

p "User #{user2.first_name} has been created"

### Catégorie FOOD et ses sous catégories ###
category_food = Category.create!(name: "Food", parent_id: nil)
p " CATEGORY #{category_food.name.upcase} HAS BEEN CREATED"

category1 = Category.create!(name: "Baby", parent_id: category_food.id)
p "Category #{category1.name} that belongs to the category #{category_food.name} has been created"

item1 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Baby").id, title: "Stewed", description: "Taste : apple and pear ", quantity_unit: "Unit", quantity_value: 6, available_start_date: "2024-05-21 14:30", available_end_date: "2024-05-25 14:30", best_before_date: nil, item_address: "61 Rue Servan, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date: "2025-01-01")
file = URI.open("https://www.french-corner-shop.com/838-large_default/compotes-bebe-des-4-mois-pomme-poire-bledina-les-4-pots-de-130g.jpg")
item1.photo.attach(io: file, filename: "stewed.jpg", content_type: "image/jpeg")
p "Item #{item1.title} has been created and belong to User with the id #{item1.user_id}"

category2 = Category.create!(name: "Bakery", parent_id: category_food.id)
p "Category #{category2.name} that belongs to the category #{category_food.name} has been created"

item2 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Bakery").id, title: "Croissant", description: "A pack of 3 croissants", quantity_unit: "Unit", quantity_value: 3, available_start_date: "2024-05-15 09:00", available_end_date: "2024-05-17 19:00", best_before_date: "2024-05-18", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Opened", home_condition: nil, is_available: true, expiry_date: "2024-07-31")
file = URI.open("https://www.coursesu.com/dw/image/v2/BBQX_PRD/on/demandware.static/-/Sites-digitalu-master-catalog/default/dw77429740/3256229622050_A1N1_1510976_S13.png?sw=388&sh=388&sm=fit")
item2.photo.attach(io: file, filename: "croissant.png", content_type: "image/png")
p "Item #{item2.title} has been created and belong to User with the id #{item2.user_id}"

category3 = Category.create!(name: "Desserts", parent_id: category_food.id)
p "Category #{category3.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item3 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Desserts").id, title: "Cake", description: "A homemade chocolate cake", quantity_unit: "g", quantity_value: 500 , available_start_date: "2024-05-17 10:00", available_end_date: "2024-05-18 20:00", best_before_date: "2024-05-19", item_address: "61 Rue Servan, 75011 Paris", food_condition: "Cooked", home_condition: nil, is_available: true, expiry_date: nil)
file = URI.open("https://easyweeknightrecipes.com/wp-content/uploads/2021/06/ChocolateCake-15-1140x1710.jpg")
item3.photo.attach(io: file, filename: "cake.jpg", content_type: "image/jpeg")
p "Item #{item3.title} has been created and belong to User with the id #{item3.user_id}"

category4 = Category.create!(name: "Drinks", parent_id: category_food.id)
p "Category #{category4.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item4 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Drinks").id, title: "Kombucha", description: "A homemade kombucha", quantity_unit: "ml", quantity_value: 500 , available_start_date: "2024-05-20 10:00", available_end_date: "2024-05-21 18:00", best_before_date: nil, item_address: "61 Rue Servan, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date:"2024-08-12")
file = URI.open("https://vitalitymagazine.com/wp-content/uploads/2016/09/Sept2016_kombucha.jpg")
item4.photo.attach(io: file, filename: "konbucha.jpg", content_type: "image/jpeg")
p "Item #{item4.title} has been created and belong to User with the id #{item4.user_id}"

category5 = Category.create!(name: "Fresh", parent_id: category_food.id)
p "Category #{category5.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item5 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Fresh").id, title: "Soja yogurt", description: "A blueberry soja yogurt", quantity_unit: "g", quantity_value: 400 , available_start_date: "2024-05-17 10:00", available_end_date: "2024-05-21 18:00", best_before_date: nil, item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date: "2024-06-23")
file = URI.open("https://organictoyourdoor.co.uk/wp-content/uploads/0000000001610.jpg")
item5.photo.attach(io: file, filename: "soja.jpg", content_type: "image/jpeg")
p "Item #{item5.title} has been created and belong to User with the id #{item5.user_id}"

category6 = Category.create!(name: "Frozen", parent_id: category_food.id)
p "Category #{category6.name} that belongs to the category #{category_food.name} has been created"
### REVOIR LA quantity_value: au besoin ###
item6 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Frozen").id, title: "Spinach", description: "A small bag of spinach leaves in portions", quantity_unit: "kg", quantity_value: 2.5 , available_start_date: "2024-05-15 12:00", available_end_date: "2024-05-30 18:00", best_before_date: nil, item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date:"2024-11-01")
file = URI.open("https://zoom.ocado.com/productImages/527/527957011_527957011_0_1596207288000_1280x1280.jpg")
item6.photo.attach(io: file, filename: "soja.jpg", content_type: "image/jpeg")
p "Item #{item6.title} has been created and belong to User with the id #{item6.user_id}"

category7 = Category.create!(name: "Pantry", parent_id: category_food.id)
p "Category #{category7.name} that belongs to the category #{category_food.name} has been created"

item7 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Pantry").id, title: "Can of chickpeas", description: "2 cans", quantity_unit: "Unit", quantity_value: 2 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-05-30 18:00", best_before_date: nil, item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date:"2025-06-01")
file = URI.open("https://i5.walmartimages.com/asr/0af29b5d-5ae3-47df-b3f1-1281ab589b26_1.06364b25738a677ef640f86fd1139865.jpeg")
item7.photo.attach(io: file, filename: "chickpeas.jpg", content_type: "image/jpeg")
p "Item #{item7.title} has been created and belong to User with the id #{item7.user_id}"

category8 = Category.create!(name: "Pet", parent_id: category_food.id)
p "Category #{category8.name} that belongs to the category #{category_food.name} has been created"

item8 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Pet").id, title: "Pâté for puppy", description: "3 cans", quantity_unit: "Unit", quantity_value: 3 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-05-20 19:00", best_before_date: nil, item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date: "2024-09-01")
file = URI.open("https://img.chewy.com/is/image/catalog/215056_MAIN._SY630_V1577203074_.jpg")
item8.photo.attach(io: file, filename: "puppy.jpg", content_type: "image/jpeg")
p "Item #{item8.title} has been created and belong to User with the id #{item8.user_id}"

category9 = Category.create!(name: "Other", parent_id: category_food.id)
p "Category #{category9.name} that belongs to the category #{category_food.name} has been created"

item9 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Other").id, title: "Lollipop", description: "Half a sachet", quantity_unit: "Unit", quantity_value: 10 , available_start_date: "2024-05-10 12:00", available_end_date: "2024-07-01 19:00", best_before_date: nil, item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: "Not opened", home_condition: nil, is_available: true, expiry_date: "2025-08-10")
file = URI.open("https://assets.iceland.co.uk/i/iceland/chupa_chups_25_assorted_flavour_mini_lollipops_150g_55640_T5.jpg?$pdpzoom$")
item9.photo.attach(io: file, filename: "lollipop.jpg", content_type: "image/jpeg")
p "Item #{item9.title} has been created and belong to User with the id #{item9.user_id}"

### Catégorie HOME et ses sous catégories ###

category_home = Category.create!(name: "Home", parent_id: nil)
p "CATEGORY #{category_home.name.upcase} HAS BEEN CREATED"

category10 = Category.create!(name: "Furniture", parent_id: category_home.id)
p "Category #{category10.name} that belongs to the category #{category_home.name} has been created"

item10 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Furniture").id, title: "Table", description: "A wooden table", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-05 14:30", available_end_date: "2024-05-05 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Like new", is_available: true)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/918mWAVbWpL._AC_SL1500_.jpg")
item10.photo.attach(io: file, filename: "table.jpg", content_type: "image/jpeg")
p "Item #{item10.title} has been created and belong to User with the id #{item10.user_id}"

category11 = Category.create!(name: "Household", parent_id: category_home.id)
p "Category #{category11.name} that belongs to the category #{category_home.name} has been created"

item11 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Household").id, title: "Hoover", description: "Bought 2 years ago and it works perfectly!", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-19 18:30", available_end_date: "2024-05-26 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Used - good", is_available: true)
file = URI.open("https://content.propertyroom.com/listings/sellers/seller1/images/origimgs/hoover-floormate-spinscrub-h3000-upright-vacuum-1_13720172353511032876.jpg")
item11.photo.attach(io: file, filename: "hoover.jpg", content_type: "image/jpeg")
p "Item #{item11.title} has been created and belong to User with the id #{item11.user_id}"

category12 = Category.create!(name: "Make up", parent_id: category_home.id)
p "Category #{category12.name} that belongs to the category #{category_home.name} has been created"

item12 = Item.create!(user_id: User.first.id, category_id: Category.find_by(name: "Make up").id, title: "Lipstick", description: "A coral lipstick", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-06-01 14:30", available_end_date: "2024-06-29 14:30", item_address: "61 Rue Servan, 75011 Paris", food_condition: nil, home_condition: "Like new", is_available: true)
file = URI.open("https://cdn.cliqueinc.com/posts/294657/best-coral-lipsticks-294657-1628559155962-main.750x0c.jpg?interlace=true&quality=70")
item12.photo.attach(io: file, filename: "lipstick.jpg", content_type: "image/jpeg")
p "Item #{item12.title} has been created and belong to User with the id #{item12.user_id}"

category13 = Category.create!(name: "Toiletries", parent_id: category_home.id)
p "Category #{category13.name} that belongs to the category #{category_home.name} has been created"

item13 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Toiletries").id, title: "Perfume", description: "Chanel n°5", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-05-10 17:00", available_end_date: "2024-12-31 18:00", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: nil, home_condition: "Open - used", is_available: true)
file = URI.open("https://www.welt.de/img/iphone_app/historyapp/mobile100522991/2252508497-ci102l-w1024/History-Mai-05-05-1921-Chanel-No-5-BM-Lifestyle-Dresden-jpg.jpg")
item13.photo.attach(io: file, filename: "chanel.jpg", content_type: "image/jpeg")
p "Item #{item13.title} has been created and belong to User with the id #{item13.user_id}"

category14 = Category.create!(name: "Other", parent_id: category_home.id)
p "Category #{category14.name} that belongs to the category #{category_home.name} has been created"

item14 = Item.create!(user_id: User.second.id, category_id: Category.find_by(name: "Other").id, title: "DVD The Leftovers", description: "All the DVDs of the series are in this DVD box set", quantity_unit: "Unit", quantity_value: 1, available_start_date: "2024-07-05 12:00", available_end_date: "2024-07-15 12:00", item_address: "16 Vila Gaudelet, 75011 Paris", food_condition: nil, home_condition: "Used - good", is_available: true)
file = URI.open("https://cdn.hmv.com/r/w-1280/hmv/files/50/5024250d-de90-460d-90b7-49a623ba8a25.jpg")
item14.photo.attach(io: file, filename: "leftovers.jpg", content_type: "image/jpeg")
p "Item #{item14.title} has been created and belong to User with the id #{item14.user_id}"

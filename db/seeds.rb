User.delete_all

user1 = User.create!(first_name: "Clothile", last_name: "Sache", phone: "00-00-00-00-00", email: "clothilde@test.com", password: "azerty", neighbourhood_type: "Building" )
p "User #{user1.first_name} has been created"

user2 = User.create!(first_name: "Coralie", last_name: "Haller", phone: "00-00-00-00-00", email: "coralie@test.com", password: "azerty", neighbourhood_type: "Residential Street")
p "User #{user2.first_name} has been created"

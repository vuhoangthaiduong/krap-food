# file_names = Dir.entries('D:/Documents/Software Engineering/Projects/krap-food/app/javascript/images/')   #=> [".", "..", "config.h", "main.rb"]
# file_names -= ["."]
# file_names -= [".."]
# file_names.each do |n|
#   puts n
# end


# 30.times do
#   food = User.first.restaurants.first.foods.build(name: Faker::Food.dish, 
#                                             price: rand(10000..100000), 
#                                             category_id: FoodCategory.all.sample.id, 
#                                             group_id: FoodGroup.all.sample.id,
#                                             availability: 1,
#                                             restaurant_id: 1)
                                    
#   # file_name = file_names.sample
#   food.save!

#   file_name = "login-bg.png"
#   3.times do
#     food.image_1.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
#     food.image_2.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
#     food.image_3.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
#   end


# end

# 30.times do
#   User.first.restaurants.first.foods.create name: Faker::Food.dish, price: rand(10000..100000), category_id: FoodCategory.all.sample.id
# end]
# Create a main sample user.
User.create!( first_name: "Huy",
              last_name: "Bui",
              email: "bqhuy@gmail.com",
              phone_number: "0987654321",
              password: "123456",
              password_confirmation: "123456")

FoodCategory.create(name: "Vagetable")
FoodCategory.create(name: "Dairy")
FoodCategory.create(name: "Meat")
FoodCategory.create(name: "Misc")

FoodCategory.all.each do |c|
  file_name = "login-bg.png"
  c.image.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
end

@food_category_ids = FoodCategory.all.pluck(:id)

address = [
  ["35 Mac Thai To, Ha Noi", 21.016570, 105.788630],
  ["123 Nguyen Trai, Ha Noi", 21.000780, 105.817350],
  ["175 Tay Son, Ha Noi", 21.007960, 105.823820],
  ["1 Le Thanh Tong, Ha Noi", 21.027764, 105.83416],
  ["35 Thai Ha, Ha Noi", 21.010970, 105.821850],
  ["107 Nguyen Phong Sac, Ha Noi", 21.040850, 105.790329],
  ["48 Minh Khai, Ha Noi", 20.995120, 105.856150],
  ["92 Tran Hung Dao, Ha Noi", 21.0195326, 105.8287675],
  ["15B Tran Hung Dao, Ha Noi", 21.0195362, 105.8544305],
  ["24 Le Van Huu, Ha Noi", 21.0164013, 105.8502722],
  ["48 Tran Xuan Soan, Ha Noi", 21.016236, 105.8486448],
  ["50A Tran Nhan Tong, Ha Noi", 21.016236, 105.8486448]
]

FoodGroup.create(name: "Something 1")
FoodGroup.create(name: "Something 2")
FoodGroup.create(name: "Something 3")
FoodGroup.create(name: "Something 4")

@food_group_ids = FoodGroup.all.pluck(:id)

12.times do |n|
  user_first_name = Faker::Name.first_name
  user_last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.cell_phone
  email = "example-#{n+1}@railstutorial.org"
  restaurant_name = Faker::Restaurant.name
  @user = User.create!( first_name: user_first_name,
                        last_name: user_last_name,
                        email: email,
                        phone_number: phone_number,
                        password: "123456",
                        password_confirmation: "123456" )
  @restaurant = Restaurant.create!( owner_id: @user.id,
                                    name: restaurant_name,
                                    address: address[n][0],
                                    latitude: address[n][1],
                                    longitude: address[n][2],
                                    open_at: Time.parse("08:00"),
                                    close_at: Time.parse("22:00") )
  (1..10).each do |m|
    food_name = Faker::Food.dish
    food = Food.create!(name: food_name,
                        price: rand(10000..100000),
                        restaurant_id: @restaurant.id,
                        availability: 1,
                        group_id: @food_group_ids.sample,
                        category_id: @food_category_ids.sample)
    file_name = "login-bg.png"
    food.image_1.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    food.image_2.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    food.image_3.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
  end
end

@user_ids = User.all.pluck(:id)

Restaurant.all.each do |c|
  file_name = "6.png"
  c.image.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
  ratings = [3, 4 ,5]
  (1..10).each do |m|
    review = Review.create!(user_id: @user_ids.sample,
                   restaurant_id: c.id,
                   content: "Something good and bad",
                   rating: ratings.sample)
    # if m == 10
    #   file_name = "thesmithburger.jpg"
    #   review.image_1.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    #   review.image_2.attach(io: File.open(Rails.root.join("app", "javascript", "images", "login-bg.png")), filename: "login-bg.png")
    #   review.image_3.attach(io: File.open(Rails.root.join("app", "javascript", "images", "cat.jpg")), filename: "cat.jpg")
    # end
  end
end

User.all.each do |c|
  file_name = "cat.jpg"
  c.image.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
end

# file_names = Dir.entries('D:/Documents/Software Engineering/Projects/fff-football-news/app/assets/images/admin')   #=> [".", "..", "config.h", "main.rb"]
# file_names -= ["."]
# file_names -= [".."]
# file_names.each do |n|
#   puts n
# end

Food.all.each do |c|
#   file_name = file_names.sample
  file_name = "login-bg.png"
  3.times do
    c.image_1.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    c.image_2.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    c.image_3.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
  end
end

# 30.times do
#   User.first.restaurants.first.foods.create name: Faker::Food.dish, price: rand(10000..100000), category_id: FoodCategory.all.sample.id
# end

# file_names = Dir.entries('D:/Documents/Software Engineering/Projects/krap-food/app/javascript/images/')   #=> [".", "..", "config.h", "main.rb"]
# file_names -= ["."]
# file_names -= [".."]
# file_names.each do |n|
#   puts n
# end


30.times do
  food = User.first.restaurants.first.foods.build(name: Faker::Food.dish, 
                                            price: rand(10000..100000), 
                                            category_id: FoodCategory.all.sample.id, 
                                            group_id: FoodGroup.all.sample.id,
                                            availability: 1,
                                            restaurant_id: 1)
                                    
  # file_name = file_names.sample
  food.save!

  file_name = "login-bg.png"
  3.times do
    food.image_1.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    food.image_2.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
    food.image_3.attach(io: File.open(Rails.root.join("app", "javascript", "images", file_name)), filename: file_name)
  end


end




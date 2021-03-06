restaurant_categories = ['Français', 'Burgers', 'Bagel', 'Vegan', 'Sandwich', 'Pizza', 'Sushi', 'Thaï', 'Italien', 'Indien', 'Coréen', 'Mexicain']

restaurant_categories.each do |restaurant_category|
  RestaurantCategory.create(name: restaurant_category)
end

if Rails.env.production?
end

if Rails.env.development?
  # print "Destroying everything"

  # OrderedMeal.destroy_all
  # Meal.destroy_all
  # Order.destroy_all
  # Restaurant.destroy_all
  # User.destroy_all
  # puts "   💥"

  # Faker::Config.locale = 'fr'

  # puts "Creating Users"
  # 15.times do
  #   user = User.new({
  #     email: Faker::Internet.email,
  #     password: "123456",
  #     first_name: Faker::Name.first_name,
  #     last_name: Faker::Name.last_name
  #     })
  #   user.encrypted_password="ENCRYPT.MY.ASS!!!KJASOPJ090923ULXCIULSH.IXJ!S920"
  #   user.save
  #   print "💂 "

  # end

  # puts "Creating restaurants"
  # 10.times do
  #   restaurant = Restaurant.new ({
  #     name: Faker::Pokemon.name,
  #     address: "#{Faker::Address.city}, France",
  #     category: rand(0..6),
  #     description: Faker::Hipster.sentence,
  #     photo_url: "http://res.cloudinary.com/dsc0gdltc/image/upload/v1479919370/lowgdzolykz7vtm1kuby.jpg",
  #     preparation_time: rand(5..20)
  #   })
  #   restaurant.user = User.all[rand(0..4)]
  #   restaurant.save
  #   print "🏡  "
  # end

  # puts "Creating meals"
  # 25.times do
  #   meal = Meal.new ({
  #     name: Faker::GameOfThrones.city,
  #     price: rand(100..10000),
  #     category: rand(0..3),
  #     photo_url: "http://res.cloudinary.com/dsc0gdltc/image/upload/v1479919370/lowgdzolykz7vtm1kuby.jpg"
  # })
  #   meal.restaurant = Restaurant.all[rand(0..9)]
  #   meal.save
  #   print "🍱  "
  # end

  # puts "Creating orders"
  # 100.times do
  #   order = Order.new ({
  #     })
  #   order.restaurant = Restaurant.all[rand(0..9)]
  #   order.user = User.all[rand(5..14)]
  #   order.save
  #   print "💶  "
  # end


  # puts "Creating ordered meals"
  # 150.times do
  #   ordered_meal = OrderedMeal.new ({
  #     })
  #   ordered_meal.order = Order.all[rand(0..59)]
  #   ordered_meal.meal = Meal.all[rand(0..29)]
  #   ordered_meal.save
  #   print "🍕 "
  # end
end


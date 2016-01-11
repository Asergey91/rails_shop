# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for a in 1..100 do
   user=User.new
   user.name = "user#{a}_name"
   user.email = "test#{a}@example.com"
   user.password = "password#{a}"
   user.password_confirmation  = "password#{a}"
   user.save!
end
for a in 1..100 do
    product = Product.new
    product.name = "product#{a}"
    product.price = 99.99
    product.image = "http://nemanjakovacevic.net/wp-content/uploads/2013/07/placeholder.png"
    product.description = "
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet.
    "
    product.sub_category_id = 1+rand(25)
    product.save!
end
for a in 1..5 do
    category = Category.new
    category.name = "category#{a}"
    category.save!
end
for a in 1..25 do
    sub_category = SubCategory.new
    sub_category.name = "sub_category#{a}"
    sub_category.category_id = (a/5).ceil
    sub_category.save!
end
for a in 1..500 do
    review = Review.new
    review.content = "
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet.
    "
    review.rating = rand(10)
    review.user_id = (a/5).ceil
    review.product_id = (a/5).ceil
    review.save!
end
for a in 1..500 do
    order = Order.new
    order.product_id=1+rand(100)
    order.user_id=1+rand(100)
    order.purchased=[true, false].sample
    order.save!
end
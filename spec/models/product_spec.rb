require 'rails_helper'

describe Product do
  context "test average comments method" do
    before do
      @product = Product.new
      @product.name = "test_product"
      @product.price = [8+rand(500)+rand, 8+rand(200)+rand, 8+rand(100)+rand, 8+rand(50)+rand, 8+rand(990)+rand].sample.round(2)
      @product.discount = [0, 0, 0, 10+rand(40)].sample
      @product.image = "http://images5.fanpop.com/image/photos/30200000/dark-darkness-30206274-371-500.jpg"
      @product.description = "
      Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet.
      "
      @product.sub_category_id = 1+rand(24)
      @product.save!
      
      
      
        @user=User.new
        @user.name = "test_user_name"
        @user.email = "test_test@example.com"
        @user.password = "passwordtest"
        @user.password_confirmation  = "passwordtest"
        @user.save!
        @user.permition = 1
        
      for a in 0..10 do  
        @review=@product.reviews.new
        @review.content = "
        Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet.
        "
        @review.rating = a
        @review.user_id = @user.id
        @review.product_id = @product.id
        @review.save!(validate: false)
      end
    end
    it 'retruns the average rating of all comments' do
      expect(@product.average_rating).to eq 5
    end
  end
  context 'testing vlidations' do
    it 'fails all validations' do
      expect(Product.new(name: 'test_name')).not_to be_valid
    end
  end
end
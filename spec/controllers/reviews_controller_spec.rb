require "rails_helper"
describe ReviewsController, :type => :controller do
  before do
    @user=User.new
    @user.name = "test_user_name"
    @user.email = "test123_test@example.com"
    @user.password = "test_password"
    @user.password_confirmation  = "test_password"
    @user.permition = 1
    @user.save!
    sign_in(@user)
    
    @product = Product.new
    @product.name = "test_product123"
    @product.price = [8+rand(500)+rand, 8+rand(200)+rand, 8+rand(100)+rand, 8+rand(50)+rand, 8+rand(990)+rand].sample.round(2)
    @product.discount = [0, 0, 0, 10+rand(40)].sample
    @product.image = "http://images5.fanpop.com/image/photos/30200000/dark-darkness-30206274-371-500.jpg"
    @product.description = "
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque pretium porttitor quam, euismod tincidunt tortor luctus quis. Sed malesuada ac orci eu molestie. In fermentum ex enim, vel vulputate lacus faucibus sit amet. Aenean venenatis, velit at semper iaculis, nisl mauris aliquet sem, a mollis nulla ex dignissim nunc. Maecenas dignissim libero lectus, eget euismod ipsum malesuada cursus. Vestibulum in lorem in ante tristique feugiat. Nulla aliquet dui sodales dignissim bibendum. Quisque nec diam leo. Suspendisse eget velit elit. Etiam vitae hendrerit tellus. Vivamus eleifend diam eu nisi finibus imperdiet.
    "
    @product.sub_category_id = 1+rand(24)
    @product.save!
  end
  describe "post #create with user logged in and out" do
  
  
    it "should create a review and redirect" do
      post :create, :review => {:user_id => @user.id, :product_id => @product.id, :rating => rand(10), :content => "Content of the review"}
      expect(Review.where(user_id: @user.id, product_id: @product.id).exists?).to eq(true)
      expect(response).to redirect_to(product_path(@product))
    end
    
   
    
    it "should not create a review but still redirect" do
      sign_out(@user)
      post :create, :review => {:user_id => @user.id, :product_id => @product.id, :rating => rand(10), :content => "Content of the review"}
      expect(Review.where(user_id: @user.id, product_id: @product.id).exists?).to eq(false)
      expect(response).to redirect_to(product_path(@product))
    end
  end
end
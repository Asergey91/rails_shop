require "rails_helper"
describe ReviewsController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
    @product = FactoryGirl.create(:product)
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
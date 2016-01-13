class ReviewsController < ApplicationController
  def new
    @review=Review.new
    @product_id = params[:product_id]
  end

  def create
    
    Review.create(review_params)
    redirect_to root_path
  end
  private
    def review_params
      params.require(:review).permit(:user_id, :product_id, :rating, :content)
    end
end

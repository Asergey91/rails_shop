class ReviewsController < ApplicationController
  def new
    @review=Review.new
    @product_id = params[:product_id]
  end

  def create
    if user_signed_in?
      Review.create!(review_params)
      redirect_to product_path(Product.find(review_params[:product_id]))
    else
      redirect_to product_path(Product.find(review_params[:product_id]))
    end
  end
  def destroy
    @review=Review.find(params[:id])
    @product=Product.find(@review.product_id)
    if current_user.is_admin?
      @review.delete
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end
  private
    def review_params
      params.require(:review).permit(:name, :user_id, :product_id, :rating, :content)
    end
end

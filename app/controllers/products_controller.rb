class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      @reviews = @product.reviews.order(created_at: :desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :sub_category_id)
    end
end

class ProductsController < ApplicationController
  protect_from_forgery
  before_action :set_product, only: [:show]
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json, :html
  
  def show
  end
  
  def index
    @products = Product.all.to_json
    render :json => @products
  end
  
  protected

    def json_request?
      request.format.json?
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

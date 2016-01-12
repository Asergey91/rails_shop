class StaticPagesController < ApplicationController
  def test
    @products = Product.all
    @carousel = @products.limit(4)
  end
end

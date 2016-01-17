class StaticPagesController < ApplicationController
  def landing_page
    @carousel = MainPagePromo.all
    @latest_products = Product.order(created_at: :desc).limit(4)
    @best_deals = Product.order(discount: :desc).limit(6)
  end
  def testing_stuff
  end
end

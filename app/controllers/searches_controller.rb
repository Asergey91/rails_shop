class SearchesController < ApplicationController
  def search
    @search_string=params[:search_string]
    @results=Product.where("name like ?", "%#{@search_string}%")
  end
end

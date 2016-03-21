class SearchesController < ApplicationController
  def search
    @search_string=params[:search_string]
    @search_string.downcase
    @results=Product.where("name like ?", "%#{@search_string}%")
  end
end

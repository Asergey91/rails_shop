class Product < ActiveRecord::Base
    has_many :orders
    has_many :users, through: :orders
    has_many :reviews
    has_one :sub_category
end

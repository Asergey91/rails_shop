class SubCategory < ActiveRecord::Base
    has_many :products
    has_one :category
end

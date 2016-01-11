class Order < ActiveRecord::Base
    has_one :user
    has_one :product
end

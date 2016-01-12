class Product < ActiveRecord::Base
    has_many :orders
    has_many :users, through: :orders
    has_many :reviews
    has_one :sub_category
    def average_rating
        av = 0
        self.reviews.each do |r|
            av = av+r.rating
        end
        return (av/self.reviews.count).to_i
    end
    def sale?
        if self.discount>0
            return true
        else
            return false
        end
    end
end

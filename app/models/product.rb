class Product < ActiveRecord::Base
    #RELATIONS
    has_many :orders
    has_many :users, through: :orders
    has_many :reviews
    has_one :sub_category
    #VALIDATIONS
    validates :name, :price, :description, :image, :sub_category_id, presence: true
    
    
    #METHODS
    def reviewed?
        if self.reviews.count>0
            return true
        else
            return false
        end
    end
    def average_rating
        if self.reviewed?
            av = 0
            self.reviews.each do |r|
                av = av+r.rating
            end
            return (av/(self.reviews.count)).to_i
        else
            return 'none'
        end
    end
    def sale?
        if self.discount>0
            return true
        else
            return false
        end
    end
end

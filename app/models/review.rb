class Review < ActiveRecord::Base
    has_one :user
    has_one :product
    
    validates :content, presence: true
    validates_uniqueness_of :user_id, :scope => :product_id
    validates :rating, presence: true
    validates_inclusion_of :rating, :in => 0..10
end

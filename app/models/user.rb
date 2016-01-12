class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :products, through: :orders
  has_many :reviews
  
  
  
  def cart_items
    return self.orders.where(:purchased=>false).count
  end
    
  
  
end

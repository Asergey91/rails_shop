class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :products, through: :orders
  has_many :reviews
  
  def is_admin?
    return self.permition==2 ? true : false
  end
  
  def cart_items
    return self.orders.where(:purchased=>false).count
  end
    
  
  
end

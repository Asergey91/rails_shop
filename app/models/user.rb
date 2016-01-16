class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :products, through: :orders
  has_many :reviews
  def cart_price
    price=0
    self.cart.each do |c|
      price=price+Product.find(c.product_id).price
    end
    return price
  end
  def is_admin?
    return self.permition==2 ? true : false
  end
  def cart
    return self.orders.where(:purchased=>false)
  end
  def purchased_products
    return self.orders.where(:purchased=>true)
  end
  def cart_items
    return self.orders.where(:purchased=>false).count
  end
  def checkout
    self.cart.each do |c|
      c.update!(:purchased=>true)
    end
  end
  
  
end

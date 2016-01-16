class CartsController < ApplicationController
  def index
    @cart_items = current_user.cart
  end

  def destroy
    @order = Order.find(params[:id])
    if (user_signed_in?) & (current_user.id == @order.user_id)
      @order.destroy
      redirect_to :back
    else
      redirect_to :back
    end
    
  end
end

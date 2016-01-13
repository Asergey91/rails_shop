class OrdersController < ApplicationController
    def add_to_cart
        if user_signed_in?
            @order=Order.new(user_id:current_user.id, product_id:params[:product_id], purchased:false)
            @order.save
            redirect_to :back
        else
            redirect_to :back
        end
    end
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Product.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def order_params
          params.require(:order).permit(:user_id, :product_id, :purchased)
        end
end

class PaymentsController < ApplicationController
  def create
    if
      token = params[:stripeToken]
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
        :amount => (current_user.cart_price*100).to_i,
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
        )
        current_user.checkout
      rescue Stripe::CardError => e
        # The card has been declined
      end
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end

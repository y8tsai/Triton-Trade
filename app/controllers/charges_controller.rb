class ChargesController < ApplicationController

def new
end

def show
end

def create

  @amount = params[:item_price] * 100

  customer = Stripe::Customer.create(
    :card => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer     => customer.id,
    :amount       => 1500,
    :description  => 'Stripe customer',
    :currency     => 'usd',
  )

  redirect_to root_path  
    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end


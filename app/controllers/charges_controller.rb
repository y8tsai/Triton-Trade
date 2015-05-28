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

  item=Item.find(params[:item_id])
  item.is_sold = true
  item.buyeremail = params[:current_useremail]
  item.save

  message = Message.new
  message.user_id = User.find_by(email: params[:current_useremail])
  message.recipient_id = item.user.id
  message.subject = "Your #{item.name} was sold!"
  message.body = ""
  message.save

  redirect_to root_path  
    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end


class ChargesController < ApplicationController

def new
end

def show
end

def create 

  customer = Stripe::Customer.create(
    :card => params[:stripeToken]
  )

  amount = 15 * 100

  charge = Stripe::Charge.create(
    :customer     => customer.id,
    :amount       => amount,
    :description  => 'Stripe customer',
    :currency     => 'usd',
  )

  item=Item.find(params[:item_id])
  item.is_sold = true
  item.buyeremail = params[:current_useremail]
  item.save

  message = Message.new
  message.user_id = params[:current_userid]
  message.recipient_id = item.user.id
  message.subject = "Your #{item.name} was sold!"
  message.body = ""
  message.save

  redirect_to root_path   

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end


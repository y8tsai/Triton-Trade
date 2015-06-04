class ClaimsController < ApplicationController
def new
end

def show
end

def create 

  item=Item.find(params[:item_id])
  item.is_sold = true
  item.buyeremail = params[:current_useremail]
  item.save

  message = Message.new
  message.user_id = params[:current_userid]
  message.recipient_id = item.user.id
  message.subject = "Your #{item.name} was claimed!"
  message.body = ""
  message.save

  redirect_to root_path   
end

end

class MessagesController < ApplicationController
  def index
    @messages = Message.where(recipient_id: current_user.id)
  end

  def show
    @messages = Message.where(
  end

  def new
  end
end

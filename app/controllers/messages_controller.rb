class MessagesController < ApplicationController
  def index
    @messages = Message.where(recipient_id: current_user.id)
  end

  def show
  end

  def new
  end
end

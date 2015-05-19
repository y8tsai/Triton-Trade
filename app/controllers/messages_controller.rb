class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages unless current_user.nil?
  end

  def show
    @messages = current_user.received_messages unless current_user.nil?
  end

  def new
  end
end

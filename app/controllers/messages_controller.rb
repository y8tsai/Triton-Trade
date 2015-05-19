class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages unless current_user.nil?
  end

  def show
    @message = current_user.received_messages.find(params[:id]) unless current_user.nil?
  end

  def new
  end
end

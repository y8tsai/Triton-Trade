class MessagesController < ApplicationController
  respond_to :html

  def index
    @messages = current_user.received_messages unless current_user.nil?
    respond_with(@messages)
  end

  def show
    @message = current_user.received_messages.find(params[:id]) unless current_user.nil?
    @sender = @message.user unless @message.nil?
    respond_with(@messages)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :recipient_id, :subject, :body)
    end
end

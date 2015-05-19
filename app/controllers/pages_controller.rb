class PagesController < ApplicationController

  def index
    @css_list = ['index']
  end

  def testpage
  end

  def profile
  end

  def info
    @css_list = ['info', 'search']
  end

  def inbox
    # @messages = Message.where recipient_id: current_user.id unless current_user.nil?
    @messages = current_user.received_messages unless current_user.nil?
  end
end

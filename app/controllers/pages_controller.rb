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
    @messages = Message.find_by recipient_id: current_user.id unless current_user.nil?
  end
end

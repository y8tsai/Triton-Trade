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
    @messages = current_user.received_messages.find(params[:id])
  end
end

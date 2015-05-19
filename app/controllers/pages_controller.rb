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
    @messages = Messages.find_by recipient_id: current_user.id
  end
end

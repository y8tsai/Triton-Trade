class PagesController < ApplicationController

  def index
    @css_list = ['index']
  end

  def testpage
  end

  def profile
  end

  def info
    @css_list = ['round-about', 'search']
  end

end

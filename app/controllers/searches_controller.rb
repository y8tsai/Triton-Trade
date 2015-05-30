class SearchesController < ApplicationController

def index
	@searches = Search.all
end

def show
	@search = Search.find(params[:id])
end

def new
	@search = Search.new
end

def create
	@search = Search.new(search_params)
	@search.save
	redirect_to @search
end

private 
  def search_params
	params.require(:search).permit(:name, :user_email, :tag, :condition, :minimum_price, :maximum_price, :category);
  end

end

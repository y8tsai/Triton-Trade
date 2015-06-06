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
	@search = Search.create(search_params)
	redirect_to @search
end

def update
	@search.update(search_params)
	redirect_to @search
end

private 
  def search_params
	params.require(:search).permit(:name, :user_email, :tag, :condition, :minimum_price, :maximum_price, :category);
  end

end

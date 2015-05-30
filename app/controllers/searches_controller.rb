class SearchesController < ApplicationController

def show
	@search = Search.all
end

def new
	@search = Search.new
end

def create
	@search = Search.new(search_params)
end

private 
def search_params
	params.require(:search).permit(:name, :user_email, :tag, :condition, :minimum_price, :maximum_price, :category);
end

end

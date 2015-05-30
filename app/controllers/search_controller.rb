class SearchController < ApplicationController

respond_to :html

def index
	
end

def new
	@search = Search.new
	respond_with(@search)
end

private 
def search_params
	params.require(:search).permit(:name, :user_email, :tag, :condition, :minimum_price, :maximum_price, :category);
end

end

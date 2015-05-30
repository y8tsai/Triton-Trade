class SearchesController < ApplicationController

before_action :set_search, :only => [:show]

respond_to :html

def index
	@searches = Search.all
	respond_with(@searches)
end

def show
	respond_with(@search)
end

def new
	@search = Search.new
	respond_with(@search)
end

def create
	@search = Search.new(search_params)
	@search.save
	respond_with(@search)
end

def update
	@search = Search.update(search_params)
	respond_with(@search)
end

def destroy
	@search = Search.destroy
	respond_with(@search)
end

private 
def set_search 
  	@search = Search.find(search_params)
end

def search_params
	params.require(:search).permit(:name, :user_email, :tag, :condition, :minimum_price, :maximum_price, :category);
end

end

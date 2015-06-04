class ItemsController < ApplicationController
before_action :set_item,  only: [:show, :edit, :update, :destroy]

before_action :authenticate_user!, only: [:edit, :update, :destroy]

before_filter :authenticate_user!, only: [:new]

  respond_to :html

  def index
    if params[:tag] == "free"
       @items = Item.where("price <= ?", 0) | Item.tagged_with(params[:tag]) 
    elsif params[:tag]
       @items = Item.tagged_with(params[:tag])
    elsif params[:category]
       @items = Item.where(category: params[:category])
    else
       @items = Item.all
    end
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :is_sold, :price, :condition, :image_url, :user_id, :category, :all_tags, :buyeremail);
    end
end

class ItemsController < ApplicationController
before_action :set_item, :authenticate_user!, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = item.new(item_params)
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
      params.require(:item).permit(:name, :description, :is_sold, :price, :condition, :image_url, :user_id);
    end
end

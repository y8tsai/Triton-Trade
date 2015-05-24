class ItemsController < ApplicationController
before_action :set_item, :authenticate_user!, only: [:show, :edit, :update, :destroy]

before_filter :authenticate_user!, only: [:new]

  respond_to :html

  def index
    if params[:tag]
       @items = Item.tagged_with(params[:tag])
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

  Stripe.api_key = "sk_test_FpsBvoNQvTMqPqr6lrJfmNuf"
  token = params[:stripeToken]
  
  begin
    charge = Stripe::Charge.create(
      :amount => @item.price * 100,
      :currency => "usd",
      :source => token,
      :description => "Charging customer"
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :is_sold, :price, :condition, :image_url, :user_id, :all_tags);
    end
end

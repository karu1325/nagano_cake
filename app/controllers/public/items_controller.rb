class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    if params[:item_name].present?
      @items = Item.where("name LIKE?", "%#{params[:item_name]}%").page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id)
  end
end

class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
    if params[:item_name].present?
      @items = Item.where("name LIKE ?", "%#{params[:item_name]}%").page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_sale, :image)
  end
end

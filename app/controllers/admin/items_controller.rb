class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_sale, :image)
  end
end

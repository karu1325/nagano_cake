class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new(address_params)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address)
    else
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path(@address)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destory
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end

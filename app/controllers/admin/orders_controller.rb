class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :billing_amount, :postage,
                                  :postal_code, :address, :name, :status)
  end

end

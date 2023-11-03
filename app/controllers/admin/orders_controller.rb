class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = @order_details.sum {|order_detail| order_detail.subtotal}
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    order_detail = @order.order_details
    if @order.status == "paid_up"
      order_detail.update(manufacture_status:"waiting")
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :billing_amount, :postage,
                                  :postal_code, :address, :name, :status)
  end

end

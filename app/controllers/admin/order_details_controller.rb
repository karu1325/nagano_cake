class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    order = @order_detail.order

    if @order_detail.manufacture_status == "manufacturing"
      order.update(status:"making")
    end
    if is_all_order_details_making_completed(order)
      order.update(status:"preparing")
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:manufacture_status)
  end

  def is_all_order_details_making_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.manufacture_status != 'finish'
        return false
      end
    end
    return true
  end
end

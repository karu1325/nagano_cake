class Order < ApplicationRecord
  belongs_to :order
  has_many :order_details, dependent: :destroy


  enum status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4
  }

  enum payment_method: {
    credit: 0,
    transfer: 1
  }

end

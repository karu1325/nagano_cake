class Order < ApplicationRecord

  enum status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4
  }

  enum payment_method: {
    credit: 0,
    bank: 1
  }

end

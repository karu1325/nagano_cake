class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum manufacture_status: {
    impossible: 0,
    waiting: 1,
    manufacturing: 2,
    finish: 3
  }
end

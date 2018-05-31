class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :user

  # set constant to generate select options
  PAYMENT_STATUS = [
    ["Not Paid", :not_paid],
    ["Paid", :paid]
  ]

  SHIPPING_STATUS = [
    ["Not Shipped", :not_shipped],
    ["Shipped", :shipped]
  ]
end

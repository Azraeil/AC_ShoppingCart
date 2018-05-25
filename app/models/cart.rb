class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_cart_item(product)
    existing_item = self.cart_items.find_by(product: product)
    if existing_item
      existing_item.quantity += 1
      existing_item.save!
    else
      cart_item = self.cart_items.build(product: product)
      cart_item.save!
    end

    return self.cart_items
  end

  def subtotal
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.product.price * cart_item.quantity
    end

    return sum
  end
end

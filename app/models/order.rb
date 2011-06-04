class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :cart_items
  
  named_scope :find_user_order, lambda { |user| { :conditions => ['user_id = ? and state = 0', user] } }
  #
  # Returns the subtotal by summing the price times quantity for all the items in the cart
  #
  def subtotal
    ("%.2f" % self.cart_items.sum("price * quantity")).to_f
  end
  
  #
  # Returns the total by summing the subtotal, taxes and shipping_cost
  #
  def total
    ("%.2f" % (subtotal + self.taxes + shipping_cost)).to_f
  end

  #
  # Adds a product to the cart
  #
  def add(object, price, quantity = 1)
    cart_item = CartItem.find(:first, :conditions => ['product_id = ? and order_id = ?', object.id, self.id])

    unless cart_item
      CartItem.create(:product_id => object.id, :price => price, :quantity => quantity, :order_id => self.id)
    else
      cart_item.quantity = (cart_item.quantity + quantity)
      cart_item.save
    end
  end

  #
  # Delete an item from the cart
  #
  def delete(object)
    cart_item = item_for(object)
    cart_items.delete(cart_item)
  end

  #
  # Remove an item from the cart
  #
  def remove(object, quantity = 1)
    cart_item = item_for(object)
    if cart_item
      if cart_item.quantity <= quantity
        cart_items.delete(cart_item)
      else
        cart_item.quantity = (cart_item.quantity - quantity)
        cart_item.save
      end
    end
  end

  #
  # Return the number of unique items in the cart
  #
  def total_unique_items
    cart_items.sum(:quantity)
  end
end

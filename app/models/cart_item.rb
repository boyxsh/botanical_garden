class CartItem < ActiveRecord::Base
  # acts_as_shopping_cart_item_for :user
  belongs_to :order
  named_scope :cart, lambda { |order| { :conditions => ['order_id = ?', order] } }
  
  #
  # Returns the cart item for the specified object
  #
  def self.item_for(object)
    CartItem.where(:item_id => object.id).first
  end

  #
  # Returns the subtotal of a specified item by multiplying the quantity times
  # the price of the item.
  #
  def subtotal_for(object)
    item = item_for(object)
    if item
      item.quantity * item.price
    end
  end

  #
  # Returns the quantity of the specified object
  #
  def quantity_for(object)
    item = item_for(object)
    item ? item.quantity : 0
  end

  #
  # Updates the quantity of the specified object
  #
  def update_quantity_for(object, new_quantity)
    item = item_for(object)
    if item
      item.quantity = new_quantity
      item.save
    end
  end

  #
  # Returns the price of the specified object
  #
  def price_for(object)
    item = item_for(object)
    item ? item.price : 0
  end

  #
  # Updates the price of the specified object
  #
  def update_price_for(object, new_price)
    item = item_for(object)
    if item
      item.price = new_price
      item.save
    end
  end
end

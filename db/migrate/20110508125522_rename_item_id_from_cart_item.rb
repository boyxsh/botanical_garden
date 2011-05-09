class RenameItemIdFromCartItem < ActiveRecord::Migration
  def self.up
    rename_column :cart_items, :item_id, :product_id
  end

  def self.down
    rename_column :cart_items, :product_id, :item_id
  end
end

class RenameOwnerId < ActiveRecord::Migration
  def self.up
    rename_column :cart_items, :owner_id, :order_id
    remove_column :cart_items, :owner_type
    remove_column :cart_items, :item_type
  end

  def self.down
    rename_column :cart_items, :order_id, :owner_id
    add_column :cart_items, :owner_type
    add_column :cart_items, :item_type
  end
end

class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :owner_id
      t.integer :owner_type
      t.integer :quantity
      t.integer :item_id
      t.string :item_type
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end

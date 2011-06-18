class RenameStateToOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :state, :boolean, :default => 0
  end

  def self.down
  end
end

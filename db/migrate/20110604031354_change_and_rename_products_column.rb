class ChangeAndRenameProductsColumn < ActiveRecord::Migration
  def self.up
    change_column :products, :category, :integer
    rename_column :products, :category, :category_id
  end

  def self.down
    change_column :products, :category, :string
    rename_column :products, :category_id, :category
  end
end

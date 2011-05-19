class AddMeaningToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :meaning, :string
  end

  def self.down
    remove_column :products, :meaning
  end
end

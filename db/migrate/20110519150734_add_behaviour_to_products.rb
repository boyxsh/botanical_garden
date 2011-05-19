class AddBehaviourToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :behaviour, :string
  end

  def self.down
    remove_column :products, :behaviour
  end
end

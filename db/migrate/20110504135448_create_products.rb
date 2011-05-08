class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :section

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end

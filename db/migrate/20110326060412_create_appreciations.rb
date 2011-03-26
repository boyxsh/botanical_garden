class CreateAppreciations < ActiveRecord::Migration
  def self.up
    create_table :appreciations do |t|
      t.integer :category_id
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :appreciations
  end
end

class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.string :state
      t.integer :priority
      t.integer :views_count
      t.references :forum

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end

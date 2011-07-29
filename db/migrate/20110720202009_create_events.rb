class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :category
      t.boolean :scheduled, :default => false
      t.boolean :has_pic, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

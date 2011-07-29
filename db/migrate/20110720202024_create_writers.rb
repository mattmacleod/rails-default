class CreateWriters < ActiveRecord::Migration
  def self.up
    create_table :writers do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :writers
  end
end

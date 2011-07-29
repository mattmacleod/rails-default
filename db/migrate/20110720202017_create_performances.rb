class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.integer :event_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :venue
      t.timestamps
    end
    add_index :performances, :event_id
  end

  def self.down
    drop_table :performances
  end
end

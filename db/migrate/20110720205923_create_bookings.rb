class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :performance_id
      t.integer :writer_id
      t.integer :issue_id
      t.boolean :sumbitted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end

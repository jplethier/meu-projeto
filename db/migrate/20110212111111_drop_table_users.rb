class DropTableUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    drop_table :users
  end
end

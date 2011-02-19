class DropTableUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    drop_table :ofertas
  end

  def self.down
    drop_table :users
    drop_table :ofertas
  end
end

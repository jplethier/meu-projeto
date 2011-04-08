class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.integer :segue
      t.integer :e_seguido

      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end

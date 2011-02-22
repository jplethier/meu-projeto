class CreateOfertas < ActiveRecord::Migration
  def self.up
    create_table :ofertas do |t|
      t.float :price
      t.string :description
      t.string :title
      t.integer :user_id
      t.string :link
      t.string :ofertas

      t.timestamps
    end
  end

  def self.down
    drop_table :ofertas
  end
end

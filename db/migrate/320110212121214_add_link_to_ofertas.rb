class AddLinkToOfertas < ActiveRecord::Migration
  def self.up
    add_column :ofertas, :link, :string
  end

  def self.down
    remove_column :ofertas, :link
  end
end

class AddTipoToOfertas < ActiveRecord::Migration
  def self.up
    add_column :ofertas, :tipo, :string
  end

  def self.down
    remove_column :ofertas, :tipo
  end
end

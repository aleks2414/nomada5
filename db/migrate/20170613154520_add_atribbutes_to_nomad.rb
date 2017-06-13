class AddAtribbutesToNomad < ActiveRecord::Migration
  def change
    add_column :nomads, :name, :string
    add_column :nomads, :facebook, :string
    add_column :nomads, :instagram, :string
    add_column :nomads, :twitter, :string
    add_column :nomads, :website, :string
    add_column :nomads, :description, :text
    add_column :nomads, :photo, :string
    add_column :nomads, :pais, :string
    add_column :nomads, :ciudad, :string
    add_column :nomads, :admin, :boolean, default: false
  end
end

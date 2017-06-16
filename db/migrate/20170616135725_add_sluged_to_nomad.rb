class AddSlugedToNomad < ActiveRecord::Migration
  def change
    add_column :nomads, :slug, :string
    add_index :nomads, :slug, unique: true
  end
end

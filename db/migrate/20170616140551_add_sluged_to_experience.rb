class AddSlugedToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :slug, :string
    add_index :experiences, :slug, unique: true
  end
end

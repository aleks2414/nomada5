class AddAttributesToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :pais, :string
    add_column :experiences, :ciudad, :string
  end
end

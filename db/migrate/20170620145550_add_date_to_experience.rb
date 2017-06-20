class AddDateToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :fecha, :date
  end
end

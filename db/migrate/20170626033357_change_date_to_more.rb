class ChangeDateToMore < ActiveRecord::Migration
  def change
  	change_column :experiences, :fecha, :datetime
  end
end

class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :iata
      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end

class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.float :vista, default: 0
      t.float :olfato, default: 0
      t.float :gusto, default: 0
      t.float :oido, default: 0
      t.float :tacto, default: 0
      t.float :latitude
      t.float :longitude
      t.float :expe
      t.string :money
      t.string :currency
      t.string :aprox_time
      t.integer :gente
      t.string :idioma
      t.boolean :is_risky
      t.boolean :is_internet
      t.boolean :is_reservation
      t.string :website
      t.text :advice
      t.references :nomad, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

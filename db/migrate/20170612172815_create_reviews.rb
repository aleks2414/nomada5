class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :star, default: 1
      t.text :comment
      t.references :experience, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

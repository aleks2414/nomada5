class AddMoreToExperience < ActiveRecord::Migration
  def change
  	add_column :experiences, :ages, :string
    add_column :experiences, :plan, :string
  	add_column :experiences, :drink, :string
    add_column :experiences, :food, :string
  	add_column :experiences, :tip, :string
    add_column :experiences, :transportation, :string
  	add_column :experiences, :weather, :string
    add_column :experiences, :is_uber, :boolean
  	add_column :experiences, :is_adaptador, :boolean
    add_column :experiences, :need_visa, :boolean
  	add_column :experiences, :is_souvenirs, :boolean
    add_column :experiences, :is_taxi_safe, :boolean
  	add_column :experiences, :credit_card, :boolean
  end
end

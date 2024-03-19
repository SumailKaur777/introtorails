class AddColumnsToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :park_category, :string
    add_column :parks, :district, :string
    add_column :parks, :classification_type, :string
    add_column :parks, :neighbourhood, :string
  end
end

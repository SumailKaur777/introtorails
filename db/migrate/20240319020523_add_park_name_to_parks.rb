class AddParkNameToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :park_name, :string
  end
end

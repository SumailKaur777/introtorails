class AddLocationDescriptionToPark < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :location_description, :string
  end
end

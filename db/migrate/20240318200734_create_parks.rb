class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :size
      t.text :amenities

      t.timestamps
    end
  end
end

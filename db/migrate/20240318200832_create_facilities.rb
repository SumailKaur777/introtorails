class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.references :park, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end

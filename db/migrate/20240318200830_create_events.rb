class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :park, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.integer :capacity

      t.timestamps
    end
  end
end

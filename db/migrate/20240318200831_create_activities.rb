class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :park, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end

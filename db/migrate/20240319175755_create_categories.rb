# db/migrate/YYYYMMDDHHMMSS_create_categories.rb
class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      # Add any other columns you need for the categories table
      t.timestamps
    end
  end
end

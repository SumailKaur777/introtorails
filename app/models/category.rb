# app/models/category.rb
class Category < ApplicationRecord
    has_many :parks
    # Other associations and validations
  end
  
# app/controllers/search_controller.rb
class SearchController < ApplicationController
    def search
      # Your search logic here
      # For example, you might retrieve search results based on the user's query
      @query = params[:q]
      @parks = Park.where("name LIKE ?", "%#{@query}%")
    end
  end
  
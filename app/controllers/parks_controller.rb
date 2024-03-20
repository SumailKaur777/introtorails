# app/controllers/parks_controller.rb
require 'net/http'
require 'json'

class ParksController < ApplicationController
    before_action :set_park, only: [:show]
  
    # GET /parks/:id
    def show
      # Fetch associated events, activities, and facilities for the park
      
      @park = Park.find(params[:id])
      @events = @park.events
      @activities = @park.activities
      @facilities = @park.facilities
      @park_category = @park.park_category
      @district = @park.district
      @classification_type = @park.classification_type
      @neighbourhood = @park.neighbourhood
    end

    def index
        @categories = Category.all
        @parks = Park.all
        uri = URI('https://data.winnipeg.ca/resource/tx3d-pfxq.json')
        response = Net::HTTP.get(uri)
        @park_data = JSON.parse(response)
  
        @parks = Park.page(params[:page]).per(10) # Fetch parks with pagination
        @parks = @parks.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end
  end
  
# app/controllers/parks_controller.rb
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
        @parks = Park.all # or whatever logic you use to fetch parks
      end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end
  end
  
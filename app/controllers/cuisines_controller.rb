class CuisinesController < ApplicationController
    def index
        cuisines = Cuisine.all
        render json: cuisines
    end

    def show
        cuisine = Cuisine.find_by(id: params[:id])
        render json: cuisine
    end

end

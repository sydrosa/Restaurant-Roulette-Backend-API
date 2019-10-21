class CuisinesController < ApplicationController
    def index
        cuisines = Cuisine.all
        render json: cuisines, except: [:updated_at, :created_at]
    end

    def show
        cuisine = Cuisine.find_by(id: params[:id])
        render json: cuisine, except: [:updated_at, :created_at]
    end

end

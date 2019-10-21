class CuisinePreferencesController < ApplicationController
    def new
        cuisine_preference = CuisinePreference.new(cuisine_preference_params)
        render json: cuisine.to_json(:include => {
            :cuisines => {:only => [:type]}
        })
    end

    def index
        cuisine_preferences = CuisinePreference.all
        render json: cuisine_preferences
    end

    def show
        cuisine_preference = CuisinePreference.find_by(id: params[:id])
        render json: cuisine_preference.to_json(:include => {
            :user => {:only => [:name, :email, :zipcode]},
            :cuisine => {:only => [:kind]}
        }, :except => [:created_at, :updated_at])
    end

    
    def create
        cuisine_preference = CuisinePreference.create(cuisine_preference_params)
        render json: {status: 'cuisine created!'}
    end

    def destroy
        cuisine_preference = CuisinePreference.find_by(id: params[:id])
    end

    private
    def cuisine_preference_params
        params.require(:cuisine_preference).permit(:user_id, :cuisine_id)
    end


end

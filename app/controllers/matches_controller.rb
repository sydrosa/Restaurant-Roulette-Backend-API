class MatchesController < ApplicationController
    skip_before_action :authorized

    def create
        match = Match.create(match_params)
        render json: {status: 'match created!'}
    end

    def new
        match = Match.new(match_params)
        render json: match.to_json(:include => {
            users => {:only => [:name, :email]}
        })
    end

    def show
        match = Match.find_by(id: params[:id])
        render json: match
    end

    def index
        matches = Match.all
    end

    private
    def match_params
        params.require(:match).permit(:user_id, :place_id, :place_lat, :plate_lng, :place_name)
    end
end

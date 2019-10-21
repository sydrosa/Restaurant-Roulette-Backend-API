class MatchesController < ApplicationController
    before_action :authenticate_user

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

    def match_params
        params.require(:match).permit(:user_id, :restaurant_id)
    end
end

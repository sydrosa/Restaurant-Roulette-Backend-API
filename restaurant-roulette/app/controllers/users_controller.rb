class UsersController < ApplicationController
    def show
        user = User.find_by(id: params[:id])
        render json: user.to_json(:include => {
            :cuisine_preferences => {:except => [:updated_at, :created_at]}
            },:except => [:password_digest, :updated_at, :created_at])
    end

    def new
        user = User.new(user_params)
    end

    def create
        user = User.create(user_params)
        render json: {status: 'user created!'}
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode, :radius)
    end
end

class UsersController < ApplicationController
    skip_before_action :authorized


    def show
        @user = User.find_by(id: params[:id])
        render json: @user.to_json(:include => {
            :cuisine_preferences => {:except => [:id, :user_id, :cuisine_id, :updated_at, :created_at], 
                :include => {
                    :cuisine => {:except => [:updated_at, :created_at]
                    }
                }
        }
            },:except => [:password_digest, :updated_at, :created_at])
    end

    def new
        @user = User.new(user_params)
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        render json: { user: @user }
      end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode, :radius)
    end
end

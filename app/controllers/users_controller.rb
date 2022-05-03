class UsersController < ApplicationController

    skip_before_action :authorize, only: :create
 
    def create #SIGNUP
        user = User.create!(user_params)
        if user.valid? 
        session[:user_id] = user.id 
        render json: user, status: :created
        else
            render json: {}
    end
end

    def show #STAY LOGGED IN 
        render json: @current_user
    end

    private 

    def user_params 
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end 


end

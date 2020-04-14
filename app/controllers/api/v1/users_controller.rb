class Api::V1::UsersController < ApplicationController
    # POST /users
    def create
        # params = {auth:{ provider: 'facebook', uid: '321321'}}
        if !params[:auth]
            render json: { error: "Auth param is missing"}
        else

            
            @user = User.from_omniauth(params[:auth])

            @token = Token.create(user: @user)
           # @token = @user.tokens.create()
            
            render "api/v1/users/show"
        end

    end
end 
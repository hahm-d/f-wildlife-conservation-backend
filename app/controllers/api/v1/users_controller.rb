class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        @user = User.find_by(username: current_user.username)
        User.update(@user.id, user_params)
        options = {:include => [:animals, :searches]}
        render json: {user: UserSerializer.new(@user, options)}, status: :accepted
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar)
    end
end
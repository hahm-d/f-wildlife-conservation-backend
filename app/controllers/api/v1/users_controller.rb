class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :update, :destroy]
    

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token, key: ENV["MAP_KEY"]}, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            options = {:include => [:animals, :searches]}
            render json: {user: UserSerializer.new(@user, options), key: ENV["MAP_KEY"]}, status: :accepted
        else
            render json: {error: 'failed to update user'}, status: :not_acceptable
        end
    end

    def destroy
        User.destroy(params[:id])
        render json: {status: :accepted}
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar)
    end
end
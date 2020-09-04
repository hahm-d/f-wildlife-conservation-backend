class Api::V1::FavoritesController < ApplicationController

    def create
        @favorite = Favorite.create(favorite_params, user: current_user)
        if @favorite.valid?
            render json: { favorite: @favorite.to_json }, status: :created
        else
            render json: { error: 'failed to create favorite' }, status: :not_acceptable
        end
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
    end

    private

    def favorite_params
        params.require(:favorite).permit(:animal)
    end
end
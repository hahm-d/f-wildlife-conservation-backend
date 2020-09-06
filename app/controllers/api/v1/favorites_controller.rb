class Api::V1::FavoritesController < ApplicationController

    def create
        updateParams = Hash.new
        updateParams["animal_id"] = favorite_params["animal_id"]
        updateParams["user_id"] = @user.id

        @favorite = Favorite.create(updateParams)
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
        params.require(:favorite).permit(:animal_id)
    end
end
class Api::V1::SearchesController < ApplicationController

    def create
        @search = Search.create(search_params, user: current_user)
        if @search.valid?
            render json: { search: @search.to_json }, status: :created
        else
            render json: { error: 'failed to create search' }, status: :not_acceptable
        end
    end

    def destroy
        @search = Search.find(params[:id])
        @search.destroy
    end

    private

    def search_params
        params.require(:search).permit(:term)
    end
end
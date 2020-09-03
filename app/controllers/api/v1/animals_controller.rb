class Api::V1::AnimalsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @animals = Animal.all
        render json: @animals.to_json
    end

    def show
        @animal = Animal.find(params[:id])
        render json: @animal.to_json
    end
end
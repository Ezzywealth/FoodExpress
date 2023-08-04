module Api
  module V1
    class RestaurantsController < ApplicationController
      before_action :set_restaurant, only: %i[edit update show destroy]
       before_action :authenticate_user!,  only: [:edit, :update, :destory, :create]

      def index
        restaurants = Restaurant.all
        render json: restaurants, status: :ok
      end

      def create
        restaurant = Restaurant.new(restaurant_params)
        restaurant.user_id = current_user.id
        if restaurant.save
          render json: restaurant
        else
          render json: restaurant.errors
        end
      end

      def destroy
        if @restaurant.destroy
          render json: Restaurant.all, status: :ok
        else
          render json: @restaurant.errors
        end
      end

      def list
        list = Restaurant.where(user_id: current_user.id)
        render json: list, status: :ok
      end

      private

      def restaurant_params
        params.require(:restaurant).permit(:name, :description)
      end

      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
    end
  end
end

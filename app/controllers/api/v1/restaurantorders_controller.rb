module Api
  module V1
    class RestaurantordersController < ApplicationController
      def index
        restaurantorders = RestaurantOrder.all
        render json: restaurantorders, status: :ok
      end
      def restaurant
        restaurantorders = RestaurantOrder.where(restaurant_id: index_params[:restaurant])
        render json: restaurantorders, status: :ok
      end
      private 
      def index_params
        params.require(:restaurantorder).permit(:restaurant)
      end
    end
  end
end

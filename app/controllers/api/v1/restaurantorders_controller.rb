module Api
    module V1
   class RestaurantordersController < ApplicationController
      def index
       restaurantorders = RestaurantOrder.all
       render json: restaurantorders, status: :ok
      end

   end
   end
   end
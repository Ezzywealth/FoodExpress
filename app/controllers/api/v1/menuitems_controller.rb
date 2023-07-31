module Api
  module V1
    class MenuitemsController < ApplicationController
      before_action :set_menu, only: %i[edit update show destroy]
      #  before_action :authenticate_user!,  only: [:edit, :update, :destory, :create]

      def index
        menus = MenuItem.all
        menu = menus.map do |menuu|
          {
            user_id: menuu.user_id,
            category_id: menuu.category_id,
            subcategory_id: menuu.subcategory_id,
            restaurant_id: menuu.restaurant_id,
            id: menuu.id,
            foodimg: menuu.foodimg.present? ? rails_blob_url(menuu.foodimg) : nil,
            name: menuu.name,
            description: menuu.description,
            price: menuu.price
          }
        end
        render json: menu, status: :ok
      end

      def create
        menu = MenuItem.new(menu_params)
        menu.user_id = 1
        menu.foodimg.attach(params[:menuitem][:foodimg]) if params[:menuitem][:foodimg]
        if menu.save
          render json: menu
        else
          render json: menu.errors
        end
      end

      def destroy
        @menu.destroy
        render json: MenuItem.all, status: :ok
      end

      private

      def menu_params
        params.require(:menuitem).permit(:name, :category_id, :subcategory_id, :restaurant_id, :description, :price,
                                         :foodimg)
      end

      def set_menu
        @menu = MenuItem.find(params[:id])
      end
    end
  end
end

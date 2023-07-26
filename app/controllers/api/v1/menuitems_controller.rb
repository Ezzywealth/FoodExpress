module Api
  module V1
    class MenuitemsController < ApplicationController
      before_action :set_menu, only: %i[edit update show destroy]
      #  before_action :authenticate_user!,  only: [:edit, :update, :destory, :create]

      def index
        menus = MenuItem.all
        render json: menus, status: :ok
      end

      def create
        menu = MenuItem.new(menu_params)
        menu.user_id = 1
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
        params.require(:menuitem).permit(:name, :category_id, :subcategory_id, :restaurant_id, :description, :price)
      end

      def set_menu
        @menu = MenuItem.find(params[:id])
      end
    end
  end
end

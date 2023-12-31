module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[edit update show destroy]
      # before_action :authenticate_user!,  only: [:index, :edit, :update, :destory, :create]

      def index
        categories = Category.all
        render json: categories, status: :ok
      end

      def create
        category = Category.create(category_params)
        category.user_id = 1
        if category.save
          render json: category
        else
          render json: category.errors
        end
      end

      def destroy
        @category.destroy
        render json: Category.all, status: :ok
      end

      private

      def category_params
        params.require(:category).permit(:name)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end

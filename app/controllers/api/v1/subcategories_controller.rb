module Api
  module V1
    class SubcategoriesController < ApplicationController
      before_action :set_subcategory, only: %i[edit update show destroy]
      #    before_action :authenticate_user!,  only: [:edit, :update, :destory, :create]

      def index
        subcategories = SubCategory.all
        render json: subcategories, status: :ok
      end

      def create
        subcat = SubCategory.new(subcategory_params)
        subcat.user_id = 1
        if subcat.save
          render json: subcat
        else
          render json: subcat.errors
        end
      end

      def destroy
        if @subcategory.destroy
          render json: SubCategory.all, status: :ok
        else
          render json: @subcategory.errors
        end
      end

      private

      def subcategory_params
        params.require(:subcategory).permit(:name, :category_id)
      end

      def set_subcategory
        @subcategory = SubCategory.find(params[:id])
      end
    end
  end
end

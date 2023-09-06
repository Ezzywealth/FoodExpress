module Api
  module V1
    class BudgetlistsController < ApplicationController
      # before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]
      before_action :set_budget, only: %i[edit update show destroy]

      def index
        budgets = BudgetList.all
        render json: budgets, status: :ok
      end

        def show
          render json: @budget, status: :ok
        end

      def create
        @user = User.find(2)
        budget = BudgetList.new(budget_params)
        budget.user_id = @user.id
        if budget.save
          render json: budget, status: :created
        else
          render json: { errors: budget.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @budget.update(budget_params)
          render json: { success: true, message: 'success', budget: @budget }, status: :ok
        else
          render json: { success: false, errors: @budget.errors.full_messages }, status: :unprocessable_entity
        end
      end


      def destroy
        if @budget.destroy
          render json: { success: true, message: 'success', budgets: @budget }, status: :ok
        else
          render json: { success: false, errors: @budget.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def budget_params
        params.require(:budget).permit(:name, :amount, :status, :category, :allow_overspending, :frequency,
                                       :start_date, :end_date, :notes)
      end

      def set_budget
        @budget = BudgetList.find(params[:id])
      end
    end
  end
end

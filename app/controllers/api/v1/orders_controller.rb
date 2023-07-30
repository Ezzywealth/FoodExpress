module Api
  module V1
    class OrdersController < ApplicationController
      def create
        customer = Customer.where(id: orders_params[:customer_id]).first

         render json: [payment, order], status: :ok
      end

      private
      def orders_params
          params.require(:order).permit(:customer_id, menu_ids: [:menu_id, :quantity, :total_price])
      end
   end
  end 
end

module Api
  module V1
    class OrdersController < ApplicationController
      def create
        customer = Customer.where(id: orders_params[:customer_id]).first

         render json: [payment, order], status: :ok
      end
      #create payment
      payment = Payment.new(customer_id: customer.id, total_amount: 0, fulfilled: false)
      payment.save

      # #create order
      order = Order.new(customer_id: customer.id,total_amount: 0, fulfilled: false, payment_id: payment.id)
      order.save
     

      private
      def orders_params
          params.require(:order).permit(:customer_id, menu_ids: [:menu_id, :quantity, :total_price])
      end
   end
  end 
end

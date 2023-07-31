module Api
  module V1
    class OrdersController < ApplicationController
      def index
        orders = Order.all
        render json: orders, status: :ok
      end

      def create
        ## find the customer if it exist
        customer = Customer.find_by(id: orders_params[:customer_id])
        if customer.nil?
          render json: { error: 'Customer not found' }, status: :unprocessable_entity
          return
        end
        # create the payment id
        payment = Payment.new(customer_id: customer.id, total_amount: 0, fulfilled: false)
        payment.save
        # create the order id
        order = Order.new(customer_id: customer.id, total_amount: 0, fulfilled: false, payment_id: payment.id)
        order.save
        # loop through the array of food order from frontend
        orders_params[:menu_ids].each do |order_params|
          menu = MenuItem.find_by(id: order_params[:menu_id])
          next unless menu

          # create menu order
          menu_order = MenuOrder.new(
            menuItem_id: menu.id,
            order_id: order.id,
            quantity: order_params[:quantity],
            total_price: order_params[:total_price]
          )
          menu_order.save
          # Create restaurant order
          restaurant = menu.restaurant
          res_order = RestaurantOrder.new(
            customer_id: customer.id,
            menuItem_id: menu.id,
            restaurant_id: restaurant.id,
            payment_id: payment.id,
            quantity: order_params[:quantity],
            price: order_params[:total_price]
          )
          res_order.save
        end
        # return payment data and order data
        render json: { payment:, order: }, status: :ok
      end

      private

      def orders_params
        params.require(:order).permit(:customer_id, menu_ids: %i[menu_id quantity total_price])
      end
    end
  end
end

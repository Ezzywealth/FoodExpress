module Api
  module V1
    class OrdersController < ApplicationController
      def index
        orders = Order.all
        render json: orders, status: :ok
      end

      def create
        customer = Customer.find_by(id: orders_params[:customer_id])
        if customer.nil?
          render json: { error: 'Customer not found' }, status: :unprocessable_entity
          return
        end

        payment = Payment.new(customer_id: customer.id, total_amount: 0, fulfilled: false)
        payment.save

        order = Order.new(customer_id: customer.id, total_amount: 0, fulfilled: false, payment_id: payment.id)
        order.save

        orders_params[:menu_ids].each do |order_params|
          menu = MenuItem.find_by(id: order_params[:menu_id])
          next unless menu

          menu_order = MenuOrder.new(
            menuItem_id: menu.id,
            order_id: order.id,
            quantity: order_params[:quantity],
            total_price: order_params[:total_price]
          )
          menu_order.save

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

        render json: { payment:, order: }, status: :ok
      end

      private

      def orders_params
        params.require(:order).permit(:customer_id, menu_ids: %i[menu_id quantity total_price])
      end
    end
  end
end



# module Api
#   module V1
#     class OrdersController < ApplicationController
#       def create
#         customer = Customer.where(id: orders_params[:customer_id]).first

#          render json: [payment, order], status: :ok
#       end
#       #create payment
#       payment = Payment.new(customer_id: customer.id, total_amount: 0, fulfilled: false)
#       payment.save

#       # #create order
#       order = Order.new(customer_id: customer.id,total_amount: 0, fulfilled: false, payment_id: payment.id)
#       order.save

#       #loop through the array from frontend
#       orders = orders_params[:menu_ids]
#       orders.each do |order_params|
#         # Create menu_order
#         menu = MenuItem.where(id: order_params[:menu_id]).first
#           menu_order = MenuOrder.new(
#           menuItem_id: menu.id,
#           order_id: order.id,
#           quantity: order_params[:quantity],
#           total_price: order_params[:total_price]
#         )
#         menu_order.save

#         # Create restaurant_order
#         restaurant = menu.restaurant
#         res_order = RestaurantOrder.new(
#           customer_id: customer.id,
#           menuItem_id: menu.id,
#           restaurant_id: restaurant.id,
#           payment_id: payment.id,
#           quantity: order_params[:quantity],
#           price: order_params[:total_price]
#         )
#         res_order.save
#        end

#       private
#       def orders_params
#           params.require(:order).permit(:customer_id, menu_ids: [:menu_id, :quantity, :total_price])
#       end
#    end
#   end
# end

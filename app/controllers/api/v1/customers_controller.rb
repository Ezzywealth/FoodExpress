module Api
 module V1
class CustomersController < ApplicationController
   def index
    customers = Customer.all
    render json: customers, status: :ok
   end

   def create
    customer = Customer.new(customer_params)
    if customer.save 
      render json: customer, status: :ok
    else
      render json: customer.errors 
    end
   end
   
   private 
   def customer_params
    params.require(:customer).permit(:name, :address, :email, :number)
   end
end
end
end
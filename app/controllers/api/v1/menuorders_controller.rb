module Api
  module V1
    class MenuordersController < ApplicationController
      def index
        menuorders = MenuOrder.all
        render json: menuorders, status: :ok
      end
    end
  end
end

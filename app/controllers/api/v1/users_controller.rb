module Api
  module V1
    class UsersController < ApplicationController
      # before_action :authenticate_user!
      def index
        user = User.all
        render json: user
      end
    end
  end
end

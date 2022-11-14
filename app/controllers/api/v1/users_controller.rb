module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_admin!
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end
    end
  end
end

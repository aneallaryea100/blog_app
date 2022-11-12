module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!
      def index
        @user = User.find(params[:user_id])
        @posts = @user.posts.includes(comment: [:user])
        render json: @posts
      end

      def show
        @post = Post.where(id: params[:id])
        render json: @post
      end
    end
  end
end

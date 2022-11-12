module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_admin!
      def index
        @posts = Post.all
        @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
        render json: @posts
      end

      def show
        @post = Post.where(id: params[:id])
        render json: @post
      end
    end
  end
end

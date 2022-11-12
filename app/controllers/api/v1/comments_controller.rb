module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_admin!

      def index
        comments = Comment.where(author_id: params[:post_id])
        render json: comments
      end

      def create
        @comment = Comment.new(text: params[:comment][:text], post_id:, user_id:)
        if @comment.save
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end
end

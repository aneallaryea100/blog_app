class PostsController < ApplicationController
  def index
    # @user = User.find(params[:id])
    @posts = Post.all
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end

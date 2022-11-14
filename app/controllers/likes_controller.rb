class LikesController < ApplicationController
  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:user_id])
    current_admin = User.find(params[:user_id])
    @like = current_admin.likes.new(
      author_id: current_admin.id,
      post_id: @post.id
    )
    if @like.save
      redirect_to user_posts_path(current_admin, @post)
    else
      render :new
    end
  end
end

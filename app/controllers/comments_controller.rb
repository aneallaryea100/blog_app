class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @user = Post.find(params[:user_id])
    @post = Post.find(params[:user_id])
    @comment = Comment.new(post_params)
    @comment.author = current_admin
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  # def delete
  #   @comment = Comment.find(params[:id]).destroy
  #   respond_to do |format|
  #     format.html { redirect_to user_path(current_user), notice: 'Comment Deleted!' }
  #   end
  # end

  def destroy
    post = Post.find(params[:post_id])
    Comment.destroy(params[:id])
    post.comments_counter -= 1
    post.save
    redirect_to user_posts_path(current_admin.id)
    # @comment.find(params[:id]).destroy

    # respond_to do |format|
    #   format.html { redirect_to user_posts_path(current_admin), notice: 'Comment deleted!' }
    # end
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end

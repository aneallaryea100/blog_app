class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @author = current_user
    @post.author = @author
    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to new_user_post_path(@author.id)
    else
      flash[:error] = 'Error:  Post was not created!!'
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

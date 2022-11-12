class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end

  def new
    @id = current_admin.id
    @post = Post.new
    @id = current_admin.id
  end

  def create
    post = Post.new(title: post_params[:title], text: post_params[:text], author: current_admin)
    @author = post.author

    if post.save
      redirect_to new_user_post_path(@author.id), message: 'Post was successfully created'
    else
      flash[:error] = 'Error:  Post was not created!!'
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    @title = @post.title
    @id.posts_counter -= 1

    respond_to do |format|
      format.html { redirect_to user_path(current_admin), notice: "Post #{@title} deleted!" }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

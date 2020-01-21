class PostsController < ApplicationController

  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if check_if_correct_user
      if above_10_mins_post
        redirect_to posts_path, flash: { error: "Unable to edit post over 10 mins after creation" }
      elsif @post.update(post_params)
        redirect_to posts_url, :notice => "Successfully edited the message"
      else
        render 'edit'
      end
    else
      flash.now[:error] = "You are not logged in as the correct user"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if check_if_correct_user
      @post.destroy
      redirect_to posts_url, :notice => "Your post has been deleted"
    else
      redirect_to posts_url, :notice => "You are not logged in as the correct user"
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def above_10_mins_post
    Time.now.utc > (@post.created_at.utc + 10.minutes).utc
  end

  def check_if_correct_user
    @post.user_id == current_user.id ? true : false
  end

end

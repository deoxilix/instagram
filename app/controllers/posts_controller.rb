class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def find_post
		@post = Post.find(params[:id])
	end

end

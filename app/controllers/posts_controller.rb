class PostsController < ApplicationController
  before_action :find_instaPost, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def show
    # @post = find_instaPost
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    # @post = find_instaPost
  end

  def update
    # @post = find_instaPost
    if @post.update(post_params)
      redirect_to post_path(find_instaPost)
    else
      render 'edit'
    end
  end

  def destroy
    @post = find_instaPost
    if @post.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def find_instaPost
		@post = Post.find(params[:id])
	end

end

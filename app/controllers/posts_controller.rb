class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = find_instaPost
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
    @post = find_instaPost
  end

  def update
    @post = find_instaPost
    if @post.update(post_params)
      redirect_to post_path(find_instaPost)
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def find_instaPost
		Post.find(params[:id])
	end

end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_instaPost, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      # flash[:success] = "Post Successful!"
      redirect_to @post, notice: "Post Successful!"
    else
      flash.now[:alert] = "Your Post could not be created! Please check the form!!"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated!"
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

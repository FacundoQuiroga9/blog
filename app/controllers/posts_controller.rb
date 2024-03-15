class PostsController < ApplicationController
  before_action :authenticate_user!


  def index
    @posts = Post.all
  end


  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created.'
    else
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post actualizado exitosamente.'
    else
      render :edit
    end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post eliminado exitosamente.'
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

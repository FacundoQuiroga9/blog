class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]


  def index
    @posts = Post.order(created_at: :desc)
  end


  def show
    @post
  end


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post creado exitosamente.'
    else
      render :new
    end
  end


  def edit
    @post
    unless @post.user == current_user
      flash[:alert] = "No tienes permiso para editar este post."
      redirect_to @post
    end
  end


  def update
    @post
    unless @post.user == current_user
      flash[:alert] = "No tienes permiso para editar este post."
      redirect_to @post
    else
      if @post.update(post_params)
        redirect_to @post, notice: 'Post actualizado exitosamente.'
      else
        render :edit
      end
    end
  end



  def destroy
    @post
    @post.destroy
    redirect_to posts_path, notice: 'Post eliminado exitosamente.'
  end

  def user_posts
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :description)
  end

  def authorize_user!
    redirect_to root_path, alert: 'No tienes autorización para realizar esta acción.' unless current_user == @post.user
  end
end

class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]


  def new
    @post = Post.new
  end

  def index 
    @post = Post.all.order(created_at: :desc)
  end

  def show
    @user = current_user
    @post = @user.post.find(params[:id])
  end

  def create
    @post = current_user.post.new(params_post)
    if @post.save
      redirect_to current_user
    else
      render :new
    end
  end

  def update
    if @post.save
      redirect_to @post
    else
      redirect_to root_path
    end
  end

  def destroy
    @post.destroy
    redirect_to current_user
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def params_post
      params.require(:post).permit(:title, :subtitle, :body, :photo, :user)
    end

    

end

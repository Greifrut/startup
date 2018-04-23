class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save 
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to current_user
  end

  private
    def params_post
      params.require(:posts).permit(:title, :subtitle, :body)
    end
end

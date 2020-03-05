class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update , :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to @post, notice: "Your post was successfully created."
    else
      render new_post_path
    end
  end

  def edit
  end

  def update
    if(@post.update(post_params))
      redirect_to @post, notice: "Your post was succesfully updated."
    else
      redirect_to edit_post_path, id: @post.id
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Your post was successfully deleted,"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  private
  
    def set_post
      @post = Post.find(params[:id])
    end

end

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

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
      redirect_to @post
    else
      render new_post_path
    end
  end

  def edit
    set_post
  end

  def show
    set_post
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

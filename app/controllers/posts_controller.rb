class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:message] = "Post successfully created"
      redirect_to post_path(@post)
    else
      flash.now[:message] = @post.errors.full_messages[0]
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.valid?
      flash[:message] = "Post successfully updated"
      @post.save
      redirect_to post_path(@post)
    else
      flash.now[:message] = @post.errors.full_messages[0]
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def increase_likes
    @post = Post.find(params[:id])
    @post.increase_likes
    @post.save
    redirect_to destination_path(@post.destination_id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end

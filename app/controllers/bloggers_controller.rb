class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      flash[:message] = "Blogger successfully created"
      redirect_to blogger_path(@blogger)
    else
      flash.now[:message] = @blogger.errors.full_messages[0]
      render :new
    end
  end

  def edit
  end

  def show
    @blogger = Blogger.find(params[:id])
    @total_likes = @blogger.total_likes
    @most_likes = @blogger.most_likes
    #@top_five = @blogger.top_five
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end

class PostsController < ApplicationController
  def index
        @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # in resources, #create comes from POST method
  def create
    # creates an instance of the record
    # that hasn't been saved yet
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path
    end
  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL
    # this will retrieve the post with a specific id
    @post = Post.find(params[:id])
  end

  # the parameters that we allow
  private
    def post_params
      params.require(:post).permit(:title, :url)
    end

end

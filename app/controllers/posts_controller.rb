class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  # in resources, #create comes from POST method
  def create
    # WHERE DOES CURRENT_USER COME FROM??
    post = current_user.posts.new(post_params)
    # creates an instance of the record
    # that hasn't been saved yet
    # post = Post.new(post_params)
    
    if post.save
      redirect_to posts_path
    else
      flash[:message] = post.errors.messages
      redirect_to :back
    end
  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL
    # this will retrieve the post with a specific id
    @post = Post.find(params[:id])
    @comment = Comment.new
    puts "This is the params: " + params.to_json
  end

  # the parameters that we allow
  private
    def post_params
      params.require(:post).permit(:title, :url)
    end

end

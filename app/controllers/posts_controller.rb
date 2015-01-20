class PostsController < ApplicationController
  def index
    @posts = Post.all
    # @post = Post.new

    #render json: @posts
  end

  # in resources, #create comes from POST method
  def create
    
    @post = current_user.posts.new(post_params)
    # creates an instance of the record
    # that hasn't been saved yet
    # post = Post.new(post_params)
    
    if @post.save
      # render :json
      # puts ">>>>>>>>>>>>> in post.save"
      render 'create.json.jbuilder'
      # render json: {success: true}
    else
      # flash[:message] = @post.errors.messages
      render json: {messages: @post.errors.messages}, status: 500
      # redirect_to :back
    end
  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL
    # this will retrieve the post with a specific id
    @post = Post.find(params[:id])
    @comment = Comment.new
    #puts "This is the params: " + params.to_json
  end

  # the parameters that we allow
  private
    def post_params
      params.require(:post).permit(:title, :url)
    end

end

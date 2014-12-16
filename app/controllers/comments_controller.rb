class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  # in resources, #create comes from POST method
  def create
    # creates an instance of the record
    # that hasn't been saved yet
    #comment = Comment.new(comment_params)
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to comment.post
    else
      redirect_to :back
    end

  end

  # this only shows 1 post
  def show
    # params[:id] will look for the id in the URL
    # this will retrieve the post with a specific id
    @comment = Comment.find(params[:id])
  end

  # the parameters that we allow
  private
    def comment_params
      params.require(:comment).permit(:post_id, :comment)
    end


end

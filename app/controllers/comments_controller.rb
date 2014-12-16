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

    # if you pass the current_user
    comment = current_user.comments.new(:post_id => params[:post_id], :comment => params[:comment])


    if comment.save
      # this will set the response for the ajax success function
      render json: comment, status: 201
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

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end

  # the parameters that we allow
  private
    def comment_params
      params.require(:comment).permit(:post_id, :comment)
    end


end

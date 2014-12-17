class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  # in resources, #create comes from POST method
  def create
    # creates an instance of the record
    # that hasn't been saved yet
    #comment = Comment.new(comment_params)
    @comment = Comment.new(
      :comment => params[:comment][:comment],
      :post_id => params[:comment][:post_id],
      :user_id => current_user.id)

    if @comment.save
      #old way is to render stuff back to ajax
      # render :json => {
      #   :data => @comment,
      #   :email => current_user.email
      #   }, :status => 201


      # this says we need to render pages in the following formats
      respond_to do |format|

        # order matters
        # in Rails convention is we need to create a file called 'create.js.erb' insdie the comments view folder
        format.js
        format.html {redirect_to @comment.post}
      end
      # redirect_to comment.post
    else
      respond_to do |format|
        format.js { render 'fail.js.erb' }
        format.html { redirect_to :back }
      end
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

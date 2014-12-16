class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def create

    comment = Comment.new(
      :comment => params[:comment], 
      :post_id => params[:post_id],
      :user => current_user
    )
    puts 'params[:comment]>>>>>>>>>>>>>>', params[:comment][:comment]
    puts 'params[:post_id]>>>>>>>>>>>>>>', params[:comment][:post_id]
    
    if comment.save
      #display
      # if no ajax this gets displayed
      render json: {
        data: comment, 
        email: current_user.email
      }, status: 201
    else
      #redirect_to :back
    end
  end


end

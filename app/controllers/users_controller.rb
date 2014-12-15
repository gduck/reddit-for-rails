class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # params[:id] will look for the id in the URL
    # this will retrieve the post with a specific id
    @user = User.find(params[:id])
    #@post = Post.all
    #@comment = Comment.all
  end

  def new
    
  end
end


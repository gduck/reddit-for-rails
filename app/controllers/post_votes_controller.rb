class PostVotesController < ApplicationController

  def create
    #finds the post, given an url with the id
    # '/post_votes/:id'
    post = Post.find(params[:id])
    # puts params.to_json
    # puts params[:id].to_json
    # puts post.to_json

    new_vote = PostVote.new(:user => current_user, :post => post)
    # new_vote = PostVote.new(:post => post, :user => current_user)

    if new_vote.save
      # this does the view for us
      render json: new_vote, status: 201
    else

    end
  end

end

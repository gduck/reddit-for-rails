class PostVotesController < ApplicationController
    before_action :authenticate_user!

  def create
    #finds the post, given an url with the id
    # '/post_votes/:id'
    post = Post.find(params[:id])
    # puts params.to_json
    # puts params[:id].to_json
    # puts post.to_json
    # skip_before_filter :verify_authenticity_token

    new_vote = PostVote.new(:user => current_user, :post => post)
    # new_vote = PostVote.new(:post => post, :user => current_user)
    # new_vote = current_user.post_votes.new(:post => post)

    if new_vote.save
      # this does the view for us
      render json: new_vote, status: 201
    else

    end
  end

end

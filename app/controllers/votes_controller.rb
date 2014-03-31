class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.build(vote_params)

    if @vote.save
      render @vote
    else
      render :text => @vote.errors.full_messages.join(", "), :status => :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:link_id)
  end

end

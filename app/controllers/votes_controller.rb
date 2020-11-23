class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      article = Article.find(params[:article_id])
      redirect_to article, notice: 'You voted for this article.'
    else
      redirect_to article, alert: 'You cannot vote for this article.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      article = Article.find(params[:article_id])
      redirect_to article, notice: 'You removed your vote.'
    else
      redirect_to article, alert: 'You cannot remove your vote.'
    end
  end
end

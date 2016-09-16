class TweetsController < ApplicationController
  before_filter :authorize

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to tweets_path
    else
      render new_tweet_path
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])

    @tweet.update(tweet_params)
    redirect_to @tweet
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

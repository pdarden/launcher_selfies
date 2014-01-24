class TweetController < ApplicationController
  def index
    Tweet.search_tweet
    @tweets = Tweet.all
    .order('tweet_created_at DESC')
    .page(params[:page])
    .per(15)
  end

  def about
  end
end

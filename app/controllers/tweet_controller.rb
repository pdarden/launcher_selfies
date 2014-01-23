class TweetController < ApplicationController
  def index
    Tweet.search_tweet
    @tweets = Tweet.all.order('tweet_created_at DESC')
  end

  def about
  end
end

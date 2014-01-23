class TweetController < ApplicationController
  def index
    @tweets = Tweet.all.order('tweet_created_at DESC')
  end

  def about
  end
end

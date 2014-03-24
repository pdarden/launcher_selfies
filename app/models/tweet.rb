class Tweet < ActiveRecord::Base
  include AutoLink

  auto_link :text, on: [:mentions, :hashtags]

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
    config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
  end

  def self.search_tweet
    @client.search("#launch_academy_selfie -rt").collect do |recent_tweet|
      if recent_tweet.media[0].present?
        Tweet.find_or_create_by(text: recent_tweet.text) do |tweet|
          tweet.username = recent_tweet.user.screen_name
          tweet.profile_image = recent_tweet.user.profile_image_url.to_s
          tweet.text = recent_tweet.text
          tweet.image = recent_tweet.media[0]["media_url"].to_s
          tweet.image_url = recent_tweet.media[0]["expanded_url"].to_s
          tweet.tweet_created_at = recent_tweet.created_at
        end
      end
    end

    @client.search("#launchacademyselfie -rt").collect do |recent_tweet|
      if recent_tweet.media[0].present?
        Tweet.find_or_create_by(text: recent_tweet.text) do |tweet|
          tweet.username = recent_tweet.user.screen_name
          tweet.profile_image = recent_tweet.user.profile_image_url.to_s
          tweet.text = recent_tweet.text
          tweet.image = recent_tweet.media[0]["media_url"].to_s
          tweet.image_url = recent_tweet.media[0]["expanded_url"].to_s
          tweet.tweet_created_at = recent_tweet.created_at
        end
      end
    end
  end
end

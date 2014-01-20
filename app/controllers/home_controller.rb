class HomeController < ApplicationController
  def index
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
    end
    @tweets = @client.search("#launch_academy_selfie -rt")
  end

  def about
  end
end

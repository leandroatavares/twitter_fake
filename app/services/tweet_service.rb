class TweetService

  attr_reader :user, :tweet

  def initialize(tweet, user)
    @user = user
    @tweet = tweet
  end

  def process
    create_tweet.save ? 'ok' : 'nok'
  end

  private

  def create_tweet
    Tweet.new(user: user, content: tweet)
  end
end
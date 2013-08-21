namespace :tweet_rake do
  desc "Using TweetStream to pull in 1 million tweets"
  task :tweets => :environment do

    User.delete_all
    Tweet.delete_all

    count = Tweet.count
    user_count = User.count

    TweetStream.configure do |config|
      config.consumer_key       = ENV['CONSUMER_KEY']
      config.consumer_secret    = ENV['CONSUMER_SECRET']
      config.oauth_token        = ENV['ACCESS_TOKEN']
      config.oauth_token_secret = ENV['ACCESS_TOKEN_SECRET']
      config.auth_method        = :oauth
    end

    puts "Preparing to stream"

    # Setting the Client before the stream
    client = TweetStream::Client
    puts client

    ## Running the rake to save Users and Tweets ##
    client.new.sample do |status|

      count += 1
      user_count += 1
      user = status.user

    # Making sure we don't save duplicate users w/ unless
            unless User.find_by_twitter_id(user.id)
            new_user = User.create(
                twitter_id: user.id,
                name: user.name,
                screen_name: user.screen_name,
                location: user.location,
                url: user.url,
                description: user.description,
                followers_count: user.followers_count,
                friends_count: user.friends_count,
                favourites_count: user.favourites_count,
                lang: user.lang)
            end
            new_tweet = Tweet.create(
                created_at: status.created_at,
                tweet_id: status.id,
                text: status.text,
                source: status.source,
                truncated: status.truncated,
                retweet_count: status.retweet_count,
                favorite_count: status.favorite_count,
                favorited: status.favorited,
                retweeted: status.retweeted,
                lang: status.lang)

                new_tweet.user = new_user
                new_tweet.save

                puts "#{count} tweets"
                puts "#{user_count} users"
        end

        client.on_limit do |skip_count|
          # do something
          puts "limited"
        end

        client.on_error do |err|
          puts err
        end

        client.on_enhance_your_calm do
          # do something
          puts "enhance calm"
        end

        client.control.info do |info|
          # do something
          puts info
        end

# Ending Rake task (tweets do)
    end

# Ending Rake File (namespace do)
end

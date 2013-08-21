class Tweet < ActiveRecord::Base

  attr_accessible :created_at,
                  :tweet_id,
                  :text,
                  :source,
                  :truncated,
                  :place,
                  :retweet_count,
                  :favorite_count,
                  :favorited,
                  :retweeted,
                  :lang

  belongs_to :user
end

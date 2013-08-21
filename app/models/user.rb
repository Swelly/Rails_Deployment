class User < ActiveRecord::Base
   attr_accessible :twitter_id,
                   :id_str,
                   :name,
                   :screen_name,
                   :location,
                   :url,
                   :location,
                   :description,
                   :followers_count,
                   :friends_count,
                   :favourites_count,
                   :lang


  has_many :tweets
end

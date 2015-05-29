class TweetsController < ApplicationController

  def new
     get_tweets.each do |tweet|
      unless Tweet.all.where(tweet_id: tweet.id.to_s).any?
        Tweet.create(tweet_id: tweet.id.to_s, text: tweet.text, tweeted_at: tweet.created_at,
                     user: tweet.user.name, user_url: tweet.user.url.to_s, user_image_url: tweet.user.profile_image_url.to_s )
        tweet.hashtags.each do |hashtag|
          if Hashtag.all.where(tag: hashtag.text).any?
            existing_hashtag = Hashtag.all.where(tag: hashtag.text).first
            existing_hashtag.update(occurences: (existing_hashtag.occurences + 1))
          else
            Hashtag.create(tag: hashtag.text, occurences: 1)
          end
        end
      end
    end
    redirect_to root_path
  end


  private


    def get_tweets
      $twitter.search('#Portland -rt', since_id: Tweet.last.tweet_id.to_i)
    end

    def find_hashtags
      get_tweets
      tweets = []
      hashtags = [];
      tweets_json_array.each do |tweets|
        tweets.each do |tweet|
          tweets << tweet
          tweet.hashtags.each do |hashtag|
            hashtags.push hashtag
          end
        end
      end
      hashtags
    end

    def parse_hashtags
      find_hashtag_occurence
      hashtags_by_amount = @hashtags_by_amount.sort_by { |_key, value| value}.reverse.first(20)
    end

    def find_hashtag_occurence
      hashtags_by_amount = {}
      hashtags.each do |hashtag|
        text = hashtag.text.downcase
        unless ['pdxevents', 'dogwalkerspdx', 'pdxcarpet', 'portland', 'petsitterpdx', 'pnw', 'clackamas', 'pdxnow', 'northwest', 'happyvalley', 'pdx', 'jobs', 'job', 'or', 'oregon', 'jobs4u', 'tweetmyjobs', 'gigs', 'gigs4u', 'usa', 'maine', 'seattle', 'hiremob', 'veteranjob'].include?(text)
          if hashtags_by_amount.keys.include?(text)
            hashtags_by_amount[text] += 1
          else
            hashtags_by_amount[text] = 1
          end
        end
      end
    end
end
